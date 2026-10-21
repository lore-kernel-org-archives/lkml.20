Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598117;
	b=EbhVkkmLZh6Xns5MCzo/q4vqhws3nGNdHnv5sIQ8RhmtqHxx8SS/tG5hbWwDurk/myzF
	 67CSn0+biPdZu6axYxlZCcpud6DAe6vqeZyR4UEFWnDOOiGKOfwpy1DbSi7gRJr9dFNZB
	 6gGRD3lazExs31myu4zhn+atY6VIxRvn9y5tvAIFyP9qhe/TjQ7la7tbYV51JTtbuHI4B
	 otjtXKdxgu8YLbXF1chM2R5oz702MkiYKJaOLWtZDFeC45zuIIfpHNg/MPGrnza7zGBe2
	 9z7frzm0/3kLkxcQq1XELfWebQdniZacBVEnww8YHnQ2O2/s4m3ulvZXwzqZTCSJ/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598117;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=pToU2/tKmBBuOKmQ3JkF1D52MBNbEUelNkDVhPvhZ2M=;
	b=CeEgvrHECXaXZf2YKsZUWaCNuldC/meU+z7jXPYyYCNceTaZ6TNxWsXiV2kAkDMQwWgR
	 ENy+4o1KVEgMLiDx2cX4lmhGOMP3t9B1LfTTAYJuJY80dISyYP/NGTPMBr5/9zPCLIAW3
	 2A3funJRgIhAcpaIC0qKDeXxzIdfSu4x409xxkOfCW6M2+BrD+/ifN65umpFOdXoHVXZL
	 WBfR6BVSw0KlbwObCdIWNkvDVqjGifdBAkn/vKCEAjgBEakhKNbiGUB6+fs11KkXV3z37
	 XY0l9t25rIxiJndU1KN8cPkjw+msc76lpx5m/mkKS2qyC1x2Ogi/On5kHOVXCTwz1Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BdUQHiQP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="aYBenH/U";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC106606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC106606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BdUQHiQP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aYBenH/U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792598115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pToU2/tKmBBuOKmQ3JkF1D52MBNbEUelNkDVhPvhZ2M=;
	b=BdUQHiQPvSWQXXZk04o9XzJzncCmNZdhOcorN9jD/+M8pPz8Iff/bLYHWogUESqDlcpu0A
	UO+SO/clShAoRv44CK/FNnWAXxmimjxYVipz5C834DNbAy5MCpdV4kP7nqxMKJbXP47mRX
	m175iOLc8FR+IMuKWwZwJRml2EwnLTg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-VYQdSWq7P_2B6bie_0nJTg-1; Wed, 21 Oct 2026 11:55:08 -0400
X-MC-Unique: VYQdSWq7P_2B6bie_0nJTg-1
X-Mimecast-MFC-AGG-ID: VYQdSWq7P_2B6bie_0nJTg_1792598107
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e29c25101so321087f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792598107; x=1793202907; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pToU2/tKmBBuOKmQ3JkF1D52MBNbEUelNkDVhPvhZ2M=;
        b=aYBenH/U4um/HozsCSp14szk5rY+kY92oxh/XSIY0PKDyjWt5WF25tPUbLIleCAw4t
         rQUnb6OHO8OWj3+3KmJUrOHQavsjuIJpHgeK3gGIGBRCskGt1PAnt83/4+PZsn2PteLw
         HUH+yPE+WgrRO1Kigj+q/lgZGNzrAy0Z/YjQtf9iyzkT3PmsYz+OQGuSxYMFVsLGrmXT
         9ULKsuD0n2dG3xx6ojaArC7DRfWn/C45njdXWrGBGeznwz1t0Dui37YNdT87YAa33xYW
         jg05maOTnsu2AgIEbxURBZV9Ee/daGmt6xsw3CGJTcePPNUBv6m2eNt+8mfvMHrvySbi
         cCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598107; x=1793202907;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pToU2/tKmBBuOKmQ3JkF1D52MBNbEUelNkDVhPvhZ2M=;
        b=ifHEZV9GGECDZ/zImLRqdlTURaoePYCTSbOCLK16Tl4mpdetAzJZ/fqZ06J6AQe0nB
         5sMXnNxmhr2yLmdpEIcoL+pIRws/NdhLInI0gp4xXFwEqsAxR2XuPwpUMKcl1Q8HRVz8
         KVtzPmSwUrR6IIGRWhlNWt4b88bmOO7eRYRT8n89d1Mjnf+5zl12/9WLdx/PRzXeyQsW
         gVylX+nwMD5O7Q7mi7RrAOQHBvZRPyjNy03YoJsJaUTgO7xSaipkelWKbYOhzagHc105
         kc13fpg7GPD8//hKmUQga+cGtGlv5DhOvKc301gLpRdhx9Ujx6HNaavk012ZmKRLnZN1
         G56w==
X-Forwarded-Encrypted: i=1; AKwUvBxBdvuZNzgK8LgcfTAwSV4S5LYtbSQJ8sy1nRpjkMmG5cLB9VWGGktfG/K6etcU+dkmabXXtyRXu1in0Rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+FYFc5YpjzyEI3NgEaYSGV8PHr+Gi4LoYzO+i1KozZfxW2XO2
	gldEVmD8G18addbjWc+bR2Iy0/1Zzh7r9NBw6CRSPb71ipDMrZFU2hj3DKfYxbOEw+2iE+11WAy
	0KiZMPIp+fakqxp07LwaAE5V683BrpncXcdS8T+X7HjGQGUkPwqh366F4pR3O6aIuZA==
X-Gm-Gg: AYBFou1//edIU9a5dyYEobCknxe2n0ODsG52LR8iQ9eB7O7D1G6n8WRfOQbwrNHV1Pn
	M54zLm4DWtneo8yiL6UhwYbKIRL9gJU374g8T7KWObzk91h12R9gEm9WDWTuxQLdVO7QiT2XiBo
	afB77Yc+DGwoINAgKaPUEsLFlM1tAqae/cIM/1m+xUYgkzqWfmdBLgW/lSMpSHERfGXH3SLrClN
	AARS6GCYE8/HG/+7tsdKHX0RFWDcj9cA1RN1CjqaywgZAStKY6f1qj70kjt5ooemqcJWiuV5tQm
	D8WqizHl3HnALyqiqzWS7hdYSkA8S98uTydWRS3zY4rWdYDQ0a1en8IkFVWXAKfPGCTbbpSoV4q
	uEazUrKOCflIF4vG4ovr4Pvb+n1s=
X-Received: by 2002:a05:600d:8051:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a1fdd6b9b4mr47597845e9.34.1792598106988;
        Wed, 21 Oct 2026 08:55:06 -0700 (PDT)
X-Received: by 2002:a05:600d:8051:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a1fdd6b9b4mr47597365e9.34.1792598106628;
        Wed, 21 Oct 2026 08:55:06 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.34.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20398f37csm1981285e9.8.2026.10.21.08.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:55:05 -0700 (PDT)
Message-ID: <ffbb1908cb2a45afbd97814f09f11401a38c179b.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, John Ogness <john.ogness@linutronix.de>,
  Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Cc: Wen Yang <wen.yang@linux.dev>, Tobias Schaffner
	 <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>
Date: Wed, 21 Oct 2026 17:55:03 +0200
In-Reply-To: <878q3rqpcy.fsf@yellow.woof>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-11-gmonaco@redhat.com>
	 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
	 <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
	 <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com>
	 <878q3xtptq.fsf@jogness.linutronix.de>
	 <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com>
	 <87bj8s8ih9.fsf@jogness.linutronix.de>
	 <b76dfd3e5a118e30ab25910f243db1cbcedc1c00.camel@redhat.com>
	 <871p9mqcn2.fsf@jogness.linutronix.de> <87ld7trgzg.fsf@yellow.woof>
	 <87mrs9q1d3.fsf@jogness.linutronix.de> <87ecdjqxnr.fsf@yellow.woof>
	 <631896ae8e44ed6356c3b79598a2facee8af9770.camel@redhat.com>
	 <878q3rqpcy.fsf@yellow.woof>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-10-21 at 13:12 +0200, Nam Cao wrote:
> Gabriele Monaco <gmonaco@redhat.com> writes:
> > On Wed, 2026-10-21 at 10:13 +0200, Nam Cao wrote:
> > > I wouldn't enable those by default though, it's way too much noises. =
As
> > > it's for debugging the model, we can have some sort of compile-time
> > > switch to turn it on.
> >=20
> > That's almost what's happening already, in-kernel use tracepoints, gate=
d by
> > static branches. Those are the closest thing you can get to a dynamic
> > compile-
> > time switch (assuming such a thing can exist), it's patching the code.
>=20
> I was talking about how people are going to enable transition events,
> not how kernel enables them. Do we expose some user API for people to
> enable at run-time (and kernel can use run-time patching or whatever),
> or people enable them while compiling their BPF programs. I think the
> latter should suffice.

Everything BPF-related will need to go through the userspace tool. From loa=
ding
monitors to enabling things, but it shouldn't require any recompilation.

Right now I use only the -t flag (enable tracing and print to stdout), we'd=
 need
some flag to only enable tracing.
After that you should be able to use ftrace as normal.

Gabriele

