Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65A4A3861;
	Mon, 21 Sep 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999736; cv=none; b=l0podO2/i7xnCj+iomNa+evufYyLnIf4aHUo00z6fHXcBq+/C7fgjfjuzoT0lBU4YNoaNV4DH9MYzIFGIpA8sfDUKKkXjpKNrtqt9EZr3FGRYZbraMC3798uPGJdABv0TSd0YksbjLbDOBTQXfwNWzDSRtiYqmN8FMpG2gPxfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999736; c=relaxed/simple;
	bh=Gn+BmxhD/JNcuU4fD1WWhF+MIRk2TooarfAtYG79tHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmUPDgEEhPIigMNQnokbjuzEvdycJlPr0oID1glayS41lIkZU/unTBcXjcAftWZqCpJx3CamCqcweKy8WeumHU1/axKdHA8acvW4mZXjHmysQACcH92Hd6tR9N4aWQyIkKgJIx6z4WMKQiRssLEcpgsr5n+cTS4SlmnFZtisIhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=DukIcoa6; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="DukIcoa6"
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B11CCA01AC;
	Mon, 21 Sep 2026 14:08:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 911BC60012;
	Mon, 21 Sep 2026 14:08:42 +0000 (UTC)
Date: Mon, 21 Sep 2026 10:08:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, paulmck@kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <20260921100840.06ed9a5c@fedora>
In-Reply-To: <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
	<d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
	<b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
	<aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
	<20260909093524.249c2a1a@gandalf.local.home>
	<arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 911BC60012
X-Stat-Signature: 114cow448kn3jskn8mcbahpqgk5q1zjp
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+6iX7aw+AEdsz8I3D5gPEpnh6FMY2CMew=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Gn+BmxhD/JNcuU4fD1WWhF+MIRk2TooarfAtYG79tHg=; b=DukIcoa6v7phdTMf6m5UVnW7+KyYEKz1hd5/etXi3bA7DJLpluAbt6f1C5jOCeFSIjn5wvc0+NRD4n83WHv98TUeHkYEybnxFaA4Ldzz60o+hYaxcFBBgLqKHiUHgALA59/muXLwTKcI6zbqsSj0UIXoP+EMlwbWH1rq4ZM/QEo=
X-HE-Tag: 1789999722-481411
X-HE-Meta: U2FsdGVkX19/UFDGGX0R7hJOl0eqhLN4z3Xyqo57qVxjhBGGJ8+irxELNoUvgRrhav0zZUuXGG6f0hqs0Ec7fzx6Gi8T20QLjXTE4R15eMV4KCrkB+iohyXm7j5VxMQkMDRRnfGvGp/Kvy34UHyyCB2LzmPCfltK5x+BV2rAu6eCUaH4u1iepzldFqm3aFvdwkeIUJli7LjN05X9JigVskE8QEKtl0Y7dHRvbldbJVrKNQKCacDAnGNXFgqX+BidWR5uBi1tjIBduCi9B9spQk+I7UD/BEKN8kZMeL65eYXlxOnc7xBSrQTKR59gsDt2GLpKhbYLevRkIbFTiih/WexqbJnkE0iN+/Sk99u2kq1M1hN2FFn7vLLnv6zadATPKFfFReoWhxgIMSCH+sjOsg==

On Mon, 21 Sep 2026 15:00:45 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> Steve, I assume you were expecting someone to send the above as a full
> patch.

Yes.

-- Steve
