Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79293E9C11
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450128; cv=none; b=idXgvW+z6Zq3eKrtIDmbor4e41Vd3/dPmFvC2PvOxxFeEgSurKLqT2GoHkN5K4q/Bv0XjxaaD0ysd8BHChg7qTS/se/+z1X0tqghHF4j6czKtBG13HmhFSIHzxoIyLR9ccGZYkvBAspn1brmHCzk3pxEpMIxP7J1vi1N8AwRAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450128; c=relaxed/simple;
	bh=bubMmErBBviwm0SDj7HwGRRwgU0dS+pqJdsiw3r0uFY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qm4fVj+A68PM2e2l/AJWIjPCqO4vWMh1odIB8+kpDPEwSai7c4sfEjN1pkHWsgSxV3W2t7hELyD3p1KbmUDqZhCRFbMItFYC2lzsMfNdFAMS3ut6/yaoRCYzaF7yhf2lQ8k7ZGMPLDnlPd9323OWFkK8ta+4qKy4UNaC4lPkVBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cP7hD0zl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bILFnGBE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cP7hD0zl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bILFnGBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791450126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bubMmErBBviwm0SDj7HwGRRwgU0dS+pqJdsiw3r0uFY=;
	b=cP7hD0zlJqfwQ9hSYKlZMs+mGpai7s61OKRF067yPQOaDfQP+QPFrLVirZq50pAG/Zus05
	PI9XUY8WLcqgCNlQqiSkFT6OchBrtnEPx5q+ZiQ7SRNYoq+4oYwr9r5OnNRynXcWI35lFw
	qpAbkanwZJ8xXejMdHciHIl2j3kQVSY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-O9CVAQkwP8OFLVuj_2JBPA-1; Thu, 08 Oct 2026 05:00:57 -0400
X-MC-Unique: O9CVAQkwP8OFLVuj_2JBPA-1
X-Mimecast-MFC-AGG-ID: O9CVAQkwP8OFLVuj_2JBPA_1791450057
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1612c4b80so47924565e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791450056; x=1792054856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bubMmErBBviwm0SDj7HwGRRwgU0dS+pqJdsiw3r0uFY=;
        b=bILFnGBEfFnqdXAHCC0WgdHHN1tzxghGY7heSU2005jQr3O9az5k+2Ki0x4tE51fKF
         8/8IU5+xJWYnMFJoPQFyGn0KII98FIpGIOARNOX20+TM4WuROnWCXqLmUDsMZjuDtCj3
         D4+pm01qgeNDSUdSrOrm/gcjb+QRGM3hovkVnH+b54v6WEdIgZU6sS+iC0ZaUMPQQZ3a
         b0o/5XCTfeRFVh4eM+8cC5gAK6uRnIoaN+Ra0Dyz0uPtolPoF9thhYDv7Nxia4EqjH0m
         Uyy2h2TUDH1aGNiUKupcOSUWm0jLq5EBsMpJwJGSr0HHzSKDx1p0eCQcwYyLE678oUdq
         5vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450056; x=1792054856;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bubMmErBBviwm0SDj7HwGRRwgU0dS+pqJdsiw3r0uFY=;
        b=siK/mCJbN44EWAumGpxS/ZFaTEHfDbI9Mm6Y8RjFuhM4fmCLf0f4YqroZnj5xeNrK0
         R+6vi6cyJQLi/Hbxjj5AvKkMg04ziyL+2h5n/iYy6kLDqK4R35cqypevsyBH0rYUUTsY
         06yCVGQsAyNiDtdEc/0VpE7f1JlVy3HrKNGbafcp9rhDxioWCjD0wkgGE6TfIxd++Iz7
         Qt6QU/b6ee5n6g3rKAIWXRm/9HSq+I/uMoMD9tVxHP38EKQfB0wumzDjGn/2zmJPX0DF
         0h1/BQN3BkLLjlFsr8Gm564kFI1C4lriI0AoLOaB4Nciv6JIuv/sPRZxPdV3/OwSLzqU
         eS5g==
X-Forwarded-Encrypted: i=1; AKwUvBzh+tsaCpgc0GGg0Az3BeeZ8t+ARzRKRIywMSxDTnI5YbC0oWCh7mYwoLr8Peu5DSqbwZCxXxYw22F2FC4=@vger.kernel.org
X-Gm-Message-State: AFuF++kOoO1mlrhodGFn6E4XtFuKZ3r8zcBdmmACrceXQZJY2HBAh10s
	LKslE2m+lvHACwD/2mWDlCfMwEckpvNBKQfmeSSHUj0SHIf8uh0lJVzOFU0hE7cJpv4B8drXoCZ
	pNt/ppHa/Ng+38FSh89O0aIWB7cgxEZBHprM5mlo7anvBBpqXADlRoCgO9glaYH6beQ==
X-Gm-Gg: AYBFou3tbce0pBqVE9559S8W26VlgCqGzA8Ac0f4sb61LIR4deHfEfO+ThpdGhuxZ6r
	BPT1vAOwJ2WVZPJS4u/poKG1TOpBxZuHlkllmupkddaX+4JXOtCIqucGSnIvMa8UsKMyHuWvl3H
	hJivcA7dAYOmF62zuBjs6fVMJnS3mJ+y506TpFtB0devdpwY73sqeaOlq5SdUviNaVwFobTrScJ
	OBQ07D8pAvXtIH6XaqdFI1RcngnNgbwtl1/b+/sQeeicquJu8nLXxh1KtB/v038EvfIMEKrP2EY
	epwMDuG78K6Seb7xXXuc0kGKm5DOP9pcavJq2mV17JvBwMUyw+/Iqr1/8SLcsNGIemL6HhSzBuI
	pBUTXV2pG3PN5t1/7WEtcf+IFaCZ0uNpid4Xy
X-Received: by 2002:a05:600c:548b:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a18045f729mr85522775e9.29.1791450056531;
        Thu, 08 Oct 2026 02:00:56 -0700 (PDT)
X-Received: by 2002:a05:600c:548b:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a18045f729mr85522395e9.29.1791450056135;
        Thu, 08 Oct 2026 02:00:56 -0700 (PDT)
Received: from ehlo.thunderbird.net (mob-5-90-15-200.net.vodafone.it. [5.90.15.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm11480317f8f.53.2026.10.08.02.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:00:55 -0700 (PDT)
Date: Thu, 08 Oct 2026 09:00:54 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
CC: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Wen Yang <wen.yang@linux.dev>,
 Tobias Schaffner <tobias.schaffner@siemens.com>,
 Viktor Malik <vmalik@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_09/15=5D_tools/rv=3A_Copy?=
 =?US-ASCII?Q?_stripped_bpf=5Fatomic=2Eh_from_libarena?=
In-Reply-To: <87ld89wtrx.fsf@yellow.woof>
References: <20261001152042.124445-1-gmonaco@redhat.com> <20261001152042.124445-10-gmonaco@redhat.com> <87ld89wtrx.fsf@yellow.woof>
Message-ID: <4F009BB7-58C2-4AB1-8FEF-61FA4B5281A2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Il 7 ottobre 2026 12:59:46 UTC, Nam Cao <namcao@linutronix=2Ede> ha scritt=
o:
>Gabriele Monaco <gmonaco@redhat=2Ecom> writes:
>> Add bpf_atomic=2Eh including atomic read/write macros like READ_ONCE() =
and
>> try_cmpxchg()=2E This version is a stripped down copy of the one curren=
tly
>> present in selftests/bpf/libarena=2E
>
>Instead of this, what do you think about using C11's atomic stuffs? I
>prefer standardized stuff when it is an option=2E

Mmh, I'm not too familiar with them, but they wouldn't be drop-in replacem=
ents as far as I understand=2E I'd need to use C11 atomic types and that wo=
uld diverge further from the kernel implementation=2E

Ideally I wouldn't like to copy libarena's implementation but I couldn't f=
ind a cleaner way to include it=2E

I'm going to look into that more carefully though=2E

Thanks,
Gabriele

