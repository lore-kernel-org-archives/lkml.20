Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288834;
	b=myjDrqTZg4Yiqk10J/IO4i4w+br91tj02A518gZdmvz5E/hZJBQsl+M+7mbvmghflBy7
	 fdwquPbVTUQcYU5nk+0on7oFyDAMHXVEn65QIh3CJJ1F5KPsc9UwbReAzSzwQd3aWx/kL
	 TpyBQcqUQEiLsODKyUDTtqZqbD/ykHdpE/CGHMOkeLoGYBZ+iUb7k5SzcmiN0PDJSlzZo
	 er6nsfkQIzHsjh/uF1n/iBC+ycRrLSI6BINVuzH7fv628c4V7QlkzmtNneGPOQYppNVg4
	 SmV2V6JAkg6WVlCulcdf+cQyuNspzuMTHf1FGj10lnivQz4SBVTnwFSyp7jnznS60mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288834;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0nrqEAsw91TWHA4QLzaVQ/nSNdp4UUFq+nfUAEE7UXk=;
	b=m9hwRBi+iAF8YXfAyiPvwB6IGJ227KYdhgo5WORRmcYAhcBSZOKR9Wx731ugNgHgyBht
	 //eB6tH3/Pl0ryT41IbD3dD6iaACzVFd3yDm+kk7XukeDcd1rIVi9b/+aPO1h9IlnDIgq
	 EMH6aoQBTtJC/+KhbNUKdUMXuvGlSU317kgyIi7YUV4TjvJ+Zf3PwRs+TYEgyuaSCx04v
	 Uj+WjnzQcmv5a3HlLcZkcRfP8jl76eKEXL6A7gw0oKHPE7pgNdt40R8jlduTpNcPFzuu7
	 Xv7gK+hYaH6hXHa5F/NBKL2J2XP5uQjALMaM3CYHZ9WaRq/1U5HUAuaGfrev+UQTD5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tUBD9Dz1;
	arc=none smtp.remote-ip=91.218.175.2
Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D7460A262A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D7460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tUBD9Dz1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CZLdBRKJbLeIbAH9EL704bhwgZWuakCTKdVW4OGDyRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794288831; v=1; x=1794893631;
 b=tUBD9Dz11Pp/EpgJIRLThq476Ii88FS+4jt8syHB4syOBqXJtHxpO6tIiVKKprO8v2lQSbpx
 TD0l9h7+22T8wSZhFLwgzptIufYsE/7d1FD9qR6dB0XxZJH32N3aBlVsOe/pLB9Oi+BY/BfnNUz
 MPR5XaZZUeSn7OpLkOrRrBfU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 612c80f98391c12d;
	Tue, 10 Nov 2026 05:33:51 +0000
X-Mizu-Trace-ID: 612c80f98391c12d
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 05:33:40 +0000
From: Akhilesh Patil <akhilesh.patil@linux.dev>
To: Joshua Crofts <crofts@kernel.org>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org, akhileshpatilvnit@gmail.com,
	akhilesh@ee.iitb.ac.in
Subject: Re: [PATCH v2] MAINTAINERS: Update Akhilesh Patil Email address
Message-ID: <20261110053340.GA2506228@u5ce4748bae3b54.ant.amazon.com>
References: <20261109063924.GA118887@u5ce4748bae3b54.ant.amazon.com>
 <20261109104443.GA531570@u5ce4748bae3b54.ant.amazon.com>
 <20261109130107.000056f8@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109130107.000056f8@kernel.org>

On Mon, Nov 09, 2026 at 01:01:07PM +0100, Joshua Crofts wrote:
> On Mon, 9 Nov 2026 10:44:43 +0000
> Akhilesh Patil <akhilesh.patil@linux.dev> wrote:
> 
> > Move to my new linux.dev email address akhilesh.patil@linux.dev
> > I plan to use this email for kernel development going forward.
> > Also update email address in few yaml and driver source files.
> > 
> > Signed-off-by: Akhilesh Patil <akhilesh.patil@linux.dev>
> > ---
> 
> Next time please don't send a v2 as a reply to v1, it can break
> tooling like b4.

ACK. Updating v3.

Regards,
Akhilesh

