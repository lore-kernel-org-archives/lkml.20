Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5273C9890
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790896037; cv=pass; b=Lz65HsM+zQohDAsSw0SDDYYAZ/CYo7/cBbmAAjnrnLcoVzDIao3/NxKpyhnQp5cpdEx3Kzvim0Au+3nlpCEMABU5mwCvaysLbqHNgLGkEUuW2qbk3R/fMQc6Cwi05R98dfWn7EbsLc1r6rfTYTO7UegrFxxv7SGH0GE1sCncNFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790896037; c=relaxed/simple;
	bh=KCv3D+/XMsj5hjQ2qR38XiJ3yPGIPImX0wLnjntJOqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+qDlDl/LwKw8J5YF8RAuqHeUzFGO07/qRU0AP4bmUyjdpviQdcgYc9HsA/Qqhh38NJ1vhoruhYYIRrfNGDQu4MpLFWSNYibq8bIAFsduP0ejH+uBknsR1nAtfqrpvdABeXQx1dOo+CXYobz288oZ0UEq5s++aeOL1wyuXUUpM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GBJYmJna; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oDVTAygh; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBJYmJna";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oDVTAygh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790896033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TqdOQpt6dGWKFEcZ75Ec/BD9ZEu1flTfgjeYi1D79ic=;
	b=GBJYmJnaAzNVBA1gGbWsTvq8/HiX93QtuT+6Bgq+JxfpEGF+6Quey7Nn7AckPKCcks5MxS
	4BqzHpX7q6z/++vYu2+LYs5sgXT+P/KR5FdsrwvKWxc29H4c4yfw6eMPYGcFucHewjy3+F
	Oh1tCuwRCryNEP44IUEWMaWBFCRZehI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-ZZBnSez_Pq-L5ET1B2jZag-1; Thu, 01 Oct 2026 19:07:12 -0400
X-MC-Unique: ZZBnSez_Pq-L5ET1B2jZag-1
X-Mimecast-MFC-AGG-ID: ZZBnSez_Pq-L5ET1B2jZag_1790896030
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3a650355e31so30794331fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790896030; cv=none;
        d=google.com; s=arc-20260327;
        b=cYGYRN8JBD8ul2ZhLa3jjWG/8Q9ULvZoyTVvmj6klHsNGENeZTolzkoXGzvvafnmzp
         vXLKX1BXIlIhN8gLEiPojX4fXJCeCNBplmDFCdA14C4si0SB+R7ixO681DiRLfYB3GeT
         UBa4DRH3zg1vefNWltrc+bYW7vaNjxDnNuHAyT1DoWibso0oIAPwzUFRvE20XeRgj/Ej
         mi/EDTthEVRIK15FU+90eJaT8S735c7VECRQk7hoV9tiLMatpSufHB+M6QdPOwYpJSlT
         85UB3F4wKtsi/Mq0l95g2UrTWSWjf75U/9w+GNng7ZFP4ulq2mwpba9JsGhD4qQyE8VM
         4lGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TqdOQpt6dGWKFEcZ75Ec/BD9ZEu1flTfgjeYi1D79ic=;
        fh=D/AR65NpYpG8j/QRm5dS81IKYLQ1qghj3hAXZDkqzPY=;
        b=gToXjpm5wndpBUwnfHrwsXwLLheEGn/OkiV9VjOh3YbWvIQMQTuX8jZAHKj9i86SHl
         8iTFmfaQT5cRgEdyHiOkweuBkIwNKQ1K8Yp4MqT1NcQmBTjbTlnvSL0qaSLNvHhjHEkl
         nCXDbpNSOsqjPSXeaF7X0D0hkeUZGIus2qlecCZ4Ti/NEC+4OiFqUzqMcr/y/pa0S1p4
         0oRzSjEaZl2mqSDhbKfvUJ+jxitR63w9jDqB9f9I6CVUMJ3Ys2mWXCRXxEsaSbaV7OoZ
         gkuUQar4r93O+UeoIAolENDUZseJo8WOISqehv8h1Ff/JuP5Ae0E10crqZuNpMiP7Yq/
         KT2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790896030; x=1791500830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqdOQpt6dGWKFEcZ75Ec/BD9ZEu1flTfgjeYi1D79ic=;
        b=oDVTAygh8MVZdZFpYjBjKmvsOCYf7buNtZ5id9pkILBCMI+Yixlwi2C+Ua2YZhrQkS
         jDs3WUWUE/NF23pXEdgYOkFrPD2fAfCmvKOSUZRv/a+QfxscoA7z7y18zUOGQu1GD2wf
         znTk4sxmKGmHamPTB5COweU6F1Zv6n15nQys3ltqm5su0zqfb8V+Z3CQhmmmTPHmJThO
         0XmEEmsCJnYclp9tOtoeB5tiDbSmQXZLy+oNc2tXOzbliW+Mv0VPxK4rdHr6k8aY8Ri3
         OwLixmgyK4E+RBWQjZp2Y4KM1eW5fq0FGu/wtLULhDucInzKJvippV2qiJTmHMzxHrTu
         Ff/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790896030; x=1791500830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqdOQpt6dGWKFEcZ75Ec/BD9ZEu1flTfgjeYi1D79ic=;
        b=zF4Yk3UOVk69KUEsJIDdKywKsKwDlJ3N1vzL3t9TQWjt1ruN/nO9WofrRwpAwWTnyC
         tRiMcxauYH5cqHwvPhaBL0AtrPWlZ49fKLmEKGwOm+2TcPWIIRrZQyNKDmIswD/szWC9
         nsIk43moYBQplj4tWAnUebWnNE8HgDZNijRbFB4s35H81YtpM3+Cmeb1D5+HQnSUiWPi
         Jcy6UU1MrZ6JJlmZxmXW5/fVRa3VPz42q+a8PhoRPaGzonbCuDylljNR3vxWbZ3ZeV8F
         egxDNwr3aioLCDCsRUViAGpLzrcG0dNhrnoe/BgzFd9OpAnUBc8ILrdgZWGPh1gNvwz9
         RFOA==
X-Forwarded-Encrypted: i=1; AKwUvByQkwY+vjI+J1nUio0xfZiIiFYG69ic8j/4pz6ALce69CP6/zqqp87TCD6dMzuOC42sc9NtrW7r6Mb+zYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6JwkrrrEMh49t7pBqVPdZU7hZh9d8LFegnPwTQKDDV3jLCPz0
	Gol3DcaOJNi68NYrSe9/gehyMGDc8yIgPMuaDbnjnaPakyIphqB1L43wFeATeb2Rw8xBEfEA1sP
	OPg8FSnQ4zy1ymsO8i3tQoCd6wAq434fXweh3D1w4B6ekUI4hzVIqR9zY+kkwI58s1re0aFzXCA
	q0l4upfXcHM9N6mfZwlpptvgyGI9KODW3gbIQVPGW1
X-Gm-Gg: AYBFou0QkLhuUndzIfujEXCMLu4kRp0SrAUzZ0leSuFl9xWIKd85XRT4+F9d6Ebxwnu
	0uOa07tNwZ2UaOkvAQC4CgET9HJDTk49IaNtfbYmMNAdV1xHVizV9vV8ED9kFoX7pi+2JWAM4r7
	bAl+FGE15jvHpMo5kSFqNkMSJT++AX6qKHgi70Nt4r2dQEZEWnPYXJaQa4
X-Received: by 2002:a05:6512:688d:10b0:5b8:edeb:5c29 with SMTP id 2adb3069b0e04-5bb9bc3af80mr182034e87.43.1790896030377;
        Thu, 01 Oct 2026 16:07:10 -0700 (PDT)
X-Received: by 2002:a05:6512:688d:10b0:5b8:edeb:5c29 with SMTP id
 2adb3069b0e04-5bb9bc3af80mr182024e87.43.1790896029983; Thu, 01 Oct 2026
 16:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910080051.160454-1-a0yami@mailbox.org>
In-Reply-To: <20260910080051.160454-1-a0yami@mailbox.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 19:06:57 -0400
X-Gm-Features: AclHuK9t8mONAizNiHQjPOigvsFX08UKMtmwbcDV9l8ZpcLYmTALibJ3JDMn-gw
Message-ID: <CAK-6q+grCijHNfX5CchXmbp+AAzG7a+PStk76K-pU9CDGVoZiA@mail.gmail.com>
Subject: Re: [PATCH] dlm: validate node weights before building member array
To: Qing Ming <a0yami@mailbox.org>
Cc: David Teigland <teigland@redhat.com>, Steve Whitehouse <swhiteho@redhat.com>, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 10, 2026 at 4:07=E2=80=AFAM Qing Ming <a0yami@mailbox.org> wrot=
e:
>
> DLM node weights are parsed as signed integers and copied into the member
> list. make_member_array() uses their sum as the allocation count, but onl=
y
> positive weights contribute entries to the array. A negative weight can
> therefore reduce the allocation without reducing the number of writes.
>
> The issue was found through static analysis of the configfs input and
> member array construction. With two recovery members weighted -31 and 32,
> the sum is 1, so recovery allocates one int and then writes the positive
> member's node ID 32 times. A reproducer using dlm_controld and dlm_tool
> triggered the same report on a KASAN kernel:
>
>   BUG: KASAN: slab-out-of-bounds in dlm_recover_members [dlm]
>   Write of size 4 by task dlm_recoverd
>
>   Call Trace:
>    dlm_recover_members
>    dlm_recoverd
>    kthread
>    ret_from_fork
>
> Reject negative weights at the configfs input boundary. Also detect
> overflow when adding non-negative weights to the signed allocation count,
> and propagate array construction errors to the recovery path.
>
> Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
> Signed-off-by: Qing Ming <a0yami@mailbox.org>
> Assisted-by: Codex:gpt-5

Acked-by: Alexander Aring <aahringo@redhat.com>

- Alex

