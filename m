Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3CA3839A0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108871; cv=none; b=JvTQCKC6KlkoSePSPdGEvUiNCn1xTB2ejf7R+eXsyhhNAgjphR+axF4vvu8ndcDTuswRa3PoHQJzw8ECOaiwIqZIQzIO0Ucr3TbQhKzIOocJiuhl1nebZAnX83asIztyvP+tg2MXhM+lsoToX29267pR5qu4qSrOKQ2yfWP/GSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108871; c=relaxed/simple;
	bh=ExOsGl2j4nMlAou7DL7hm0Ih5Hfn8Z4OdLD7D7iXx/g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IuCKRQg2oBwCeu8e9MSrRBS5+BwHsV2tCEliSOuC8cHyOP0NyImZoq3na/h8/kRD+UXper8MOIQuBHoSPjCc4j830Qmsk69N3OhgCEGV5c3uKBjSDAoFANZXUde7tboFJxp/EWtB19C2EqGNaBEAQbG2a0lChH9MXwo7jSLbvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hzhX8wi7; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hzhX8wi7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ExOsGl2j4nMlAou7DL7hm0Ih5Hfn8Z4OdLD7D7iXx/g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789108861; v=1; x=1789713661;
 b=hzhX8wi7czmdIH7/JaMa0S5TzkjJZY4gwY5uSktT5YYpndJu/sAex8VltPsbJJEScxnhfb1s
 YYWI4tYYhwgBYSpEHc5rlTR6bSXK1fp5U+Vsqd97r7vAgjogL1L132R6tcMlt5LJjPboyLhUqH3
 oUCRrRFw84/0NRfPsU84sVwA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c00feb8a6972bf63;
	Fri, 11 Sep 2026 06:41:01 +0000
X-Mizu-Trace-ID: c00feb8a6972bf63
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 08:41:00 +0200
Message-Id: <DLCA5RRJUQKI.37EVVUC379JC4@linux.dev>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Michael
 Straube" <straube.linux@gmail.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, "Bitterblue Smith" <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH v11 4/7] wifi: rtw88: sdio: zero the padding added to a
 TX transfer
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Ping-Ke Shih" <pkshih@realtek.com>, "Luka Gejak" <luka.gejak@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909074556.55709-1-luka.gejak@linux.dev>
 <20260909074556.55709-5-luka.gejak@linux.dev>
 <d6507fd0447c4c09a9c80bb57dfef35c@realtek.com>
 <DLBQ2H40DC71.2Z3B32X9JQ17I@linux.dev>
 <f139980a5614454cac50517a5b602cd5@realtek.com>
In-Reply-To: <f139980a5614454cac50517a5b602cd5@realtek.com>

On Fri Sep 11, 2026 at 2:30 AM CEST, Ping-Ke Shih wrote:
> Luka Gejak <luka.gejak@linux.dev>
>>=20
>> One thing to decide, though. The commit message says the padding "costs
>> nothing observable", which is too strong given the numbers in that same
>> paragraph. Do you think it needs rewording? If so, would you be willing
>> to amend it yourself when applying? That seems better than a resend of
>> seven patches for one line.
>
> I can amend it myself as
>
> "... padding the transfer costs about 2% observable over transfer."
>
> Or you can help to reword the paragraph. I can copy & paste it.
>
> Ping-Ke

Please amend it yourself, that is much better than a resend. Here is the
change:
 =20
  "padding the transfer costs nothing observable:" to "padding the transfer=
=20
  costs about 2% observable over transfer:"

Leave the rest as is, after semicolons there are numbers to explain that 2%=
.

Best regards,
Luka Gejak
