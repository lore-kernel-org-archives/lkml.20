Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794455305;
	b=ayG4VvU4ZHv8EH6RTpxULzXDiphvJOYJ9Npd50INvOjH61LkHp3SdGsA62mrfw63d75T
	 5MPvxSvb7A+DQlgZeiKMJVcFFveEmLoqwPVDP1ERCEAUdf4mJYngbRQltF3+ZfOiAIwsi
	 wH+xpAtYaV3R0U4MJbMI1ZO8fqAhSTJYPG3eRntckgNkpVTFCsrybSj39JH6o1ITS6Jw3
	 TuLFLiXdLNbIcYBUnOuJRp++c5he+zhKuaNFVevfKGXDAeMCkITR4h+hhKGtAaxbs0pPk
	 ixowmj14WQsnM0TWD196hmxTNFGD0BbnwUTxyGsSk6QGPs4gkZXaXV/o2dOkTlEgavg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KhSncitynV2ttbkta0+XeVmF6scMEZkRXU25IseA/fY=;
	b=KnsGhRl59y8ClhI4gj6n2nEN89NKuqJmUeLqKWcFffrs9oaPn36DjODJVNJSAYM0QbzT
	 UrmORWbVxEsurkSYndw8hlVTdVC8txO8XG0p1RcZ0iB1depufiIqipPvQdulIhkYrqD9A
	 3ozsDSbMItdLSK33h1kgHdPO8fguYoHv8W3glUbZQ1yrWfoD3ehmRbC6oRw6HDlVfYPc5
	 G2egN7a1oEmESHs7/QdJFsRnKATYSEGY6lZg+TEnxtRKRn0+8MN01vrr8r+ZgxOO4hV3D
	 vH/sHgZRPm2HWKsPs04CfVoMdzkB8tQF1yMnFGgCzXXfoFo+nKnv3h9vycCDPPJYrJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DthBIz0/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1186606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1186606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DthBIz0/
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b31261e8a9so29546527b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794455304; cv=none;
        d=google.com; s=arc-20260327;
        b=VLZx3tzlMai8BhFujYJ1h7wuRJI3IVj4zFX8UOV6hTj5H5CFfcYNrbYCcUMJlbchya
         sRaeefvcalu6UwRie27LOFyz84adM1dYtM5DEkWiZ2tErAJHPN+I03medPN4suk2bDXt
         IF42jw52m6SMOJ/WcLiJqKB6ACQd55MA4CmrwG2Pch14lAmhE/yTPWhjNKwmKOeWQIXR
         m02NY/+yHyiJ0i6tTXpkoP9u3cBNaj1xBGkSHQMfGtoXnQx9vkVSzsizUy42FN6gGNGq
         tnxxS0lk1fSCsvOvGe6wyPJ5R0HhJr4XMRVmOlxCPSUG0F7by4Ix89r3h9kDpmxuliJ8
         DY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KhSncitynV2ttbkta0+XeVmF6scMEZkRXU25IseA/fY=;
        fh=pYGU0XxIUdFshcfOU51hqkuDFJMF1QPcDkIfCIc2ygk=;
        b=pkr1xzcvdQjQt0LmPpt8ZkWkSbYrulmoLWitAcGnF8w26cp8OjBt6ZFEfWCOcDHS2o
         tWa742dWGX5asi0JZj9HtfXfqgROwGoTXZTNLIVoUVXz8sBy2+0/328m+MFtiNmyRfS2
         bgj9//f0NyjcKPef15Q3HUZ5kJgDZsRrKIc5+3OqjLsBTPqkidgBtuNOSMvgvKNlcje5
         BUKqi9zJZiNcvZ95jV/8O03aANV6O+/YeAgHXQagsKvgekUXLL9A0YfpKFHfcIM7Q0kQ
         AGKnioPiocttipUST11LvDWtXs8ngH9yTOg1qnEwh6zmfix3kPTfym2Ocb9Jbw4NqiWP
         neyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794455304; x=1795060104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KhSncitynV2ttbkta0+XeVmF6scMEZkRXU25IseA/fY=;
        b=DthBIz0/p5PHvXyx9jpE2O7jhfDMwLS5qOuEkPNy7+nYK6yrnKRyhJ7bjVFtMPd7cO
         CXpRx9DQA1QKJO4a2Sk8UwKz+hMQQW4xxWf/Vn+ktJKa7ioPx62NJ2CXiwXyqfCqI9Nk
         yeOTsvuctvOvonm7I6PuulJxKP9lAznweTIpa1ysE1QsEqUnf/7jJnFWp6MydZIm3IxC
         069QMPL2IrtPB2VdG7QHPBxv9Us/QCoXqLVIb3Bepd+6mk8qVf3FeErigAxbFqGjuWM2
         Jf/B43JoH2r2uQrMuqGsqMkbzb3DMetMvTYuIz/5VouUIIEFThZ9QkZRkfzfMnoy3etE
         bS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794455304; x=1795060104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhSncitynV2ttbkta0+XeVmF6scMEZkRXU25IseA/fY=;
        b=Nwf0fW1bHhAWqdb/CVbCBYJM4CH8zjXTMlArp39iXsU09+qYomrkS3S48tv1EbvMCy
         /Ytjxd3/3a+4sdtRiEbMmuApeCubT/HQmP8M+PZMrC4Qx/Qj1zNL1h6ASiGW3zELiLf9
         vp1Er1UP4PSM82HWQsWsdjmZqliwt68PDjtD7nn3/acI7G3a1iv3rMB0bWjgDfPn5BRq
         1mPCkDPmDKhiODPNIYqcBHQ5O2ZU3o5/tlD6YOn8UJvkVlb/WukMW0Kh3hOGxZKlbxKw
         QakKhRTYZ48aLU2TJfZFmOz2VUmc1MsySo3Ro9Um7wf6OboKE1DOW2NDT4IZFfBOv+UI
         MWDw==
X-Forwarded-Encrypted: i=1; AL+hErGW+dvYqeU0vS8OLX2TnFQ1m7Ye2aVIBqKX5QEgYq5Igm6+TNE1DmVVMmwze+6e4mtKJ0pES9dGtdCgZkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ic5+NbV7KCBWYyltOeOm9rhjVMbXlniln5xjVW5X1qHLUVNPN
	z9YhrlcIOu3eY4ZPou7utl6n/sg5jV36BM0hm0HdrlgEcJ5VCQeo21GNCCXCsXxcmAveH0TKEkv
	gmYZui40ifMG9jlzfD8fn8q+3Xy54fNY=
X-Gm-Gg: AYBFou0qBFXMYm7ONZMI4zQr7xITyKVjUFov4wPlbqZWnurrBCNb0LpEGVHnG6REhAR
	k5qNNFemqeZ9zBVAY15PSeZYASoERIizFc60UbHZc77DffqbpqrOEg6jxzUU+rZiQ5mBRJTp1BB
	ZJb35W3nO3/XswBiznV+1cHLdTSn5pWx9RPwsk6olKnLp32GzTI67ihC1fhbsO0GA1pyGDFQZVx
	abYMXmxHTNwW5nUxnzG02uy1flFs28rC53JJkURocIVNfsbww26ECwcCrdJ68/c+8LbbH3B/llt
	jGf291UNvLziXZiDBWn4IzUtujVxLuFyrw5GShH57BJFZIYelpZqYuc3/HmAtSZkutX+/Y+uHhp
	YOn9a83VJ/Crg+RW7IfrcOcx1cZekWw5J2LTZ9plNPZhmkmrhVtLnEzRwkoE=
X-Received: by 2002:a05:690c:7013:b0:8a3:7828:58b3 with SMTP id
 00721157ae682-8b3a7dba933mr39348317b3.7.1794455303703; Wed, 11 Nov 2026
 19:48:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004061007.7433-1-jsjlee1020@gmail.com> <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
 <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com> <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org>
In-Reply-To: <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org>
From: Seongjae Jeong <jsjlee1020@gmail.com>
Date: Thu, 12 Nov 2026 12:48:10 +0900
X-Gm-Features: AclHuK-UZhDlBHmuWszdjabS_-A-QxzVVRbwjWQK-vw6pJDf0jFFjAh-PDig9Cw
Message-ID: <CAPHXVry2O-AYxTvGdzu+m6b3Q=ho=xL0kpWWqCn0vjj-gOe0ZQ@mail.gmail.com>
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated blocks
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, yi.sun@unisoc.com, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chao,

Thanks for checking.
I agree that 81ffbd224e5f is the right Fixes tag.

I=E2=80=99ve sent v2 with stable on Cc and an additional Fixes tag for
a66cdd985532 to cover the discard bitmap handling. Does the second
Fixes tag look appropriate to you?

Thanks,
Seongjae
