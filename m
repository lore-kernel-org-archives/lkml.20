Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792703385;
	b=I/Qic/1c8QbFa+VGzyD2s6HZrAgNQbp4yvASCLd9aJ1cKKx+CzULjw/0XeIgrZJxJsn3
	 IAGygY1GUGTi66qnHB4Vid2zIfTHu0unkXuv9clf0lTOvKXHaP5jblV8KbeA8fJ1SWi+T
	 l0ddQM/7RZjoQ7zMAwXwUnMkBOeJJqZvndKXeGXU8I1XE+xgpqlU02huHqKifyjkddYgf
	 m50AkPCcpOnTg9i6HlTwSsN33p/fRi/dQre0BbMBGxjbv/+c5w0nIRrq0q6FLWVKRo5oi
	 tHrtEMFUund99QKD5UhLjLqXzvPU/hjD5voTWzFSYeTUyeQOC96CM72WXfFVd5cpJzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=idDc6DGD+fulN+NrjDdkqMJrhpGOYDh59D9l9UTrFSQ=;
	b=ZQ2BzYzayl7h7XpkOl0OnOmmeR7n+sTVw32WGGEhukOqL2kZztWSm3qXF8l47jYQe7+E
	 ALxnLLUH8spATirhTa9cRU8bt/EYau3OPLehjtBU15zr9BniOXWc14m/eySQJVg5mH+8Q
	 lM99Y4TFPnG4NS8jTG2C2+jlYies7fXW3BPJgUuhAzA+BQ0gu7BTcNI6udN17iX4744jp
	 KMnljRiQ3ehs1RobIv9mJYjTWrYuDK3qTdWOCCT0Eh/TSxUfTQG7relhJUZ98e0StwVmc
	 kpw/vxfH5xNGP1ZwsE2yd3Y1nsbBQVWN0j3a3jAWJc4Y9qziiyVzfwWibwBQGRrWfww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RiP61Pyy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D554606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D554606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RiP61Pyy
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4d870d54so136183f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792703384; cv=none;
        d=google.com; s=arc-20260327;
        b=jTbxhG/WLdBR4Zb3dGa1ysuoZ+b+nTn0Lr45j2FSb6lHmU4DmTxTvAK7SOoWupmVDd
         +uuTVDlwDfEvlK7EllK6PbwGP4q73FI9aqteqtsJxUcjmst009i1QnOc4jV6HQ+MI9AQ
         O6Nva4HX+5tD/dZ9eU3OMEQAZ7p/Jr8T8eHEiFmFeygMc8rVQUsvKCXpZiTRdVSZpu41
         9i8TfV8j2jWsz5WKMU01nNmmpjVJZR3+6tpc4DRzzU58JMI2SpsmwZbvcfbMYikvJc05
         pZ/bd3Sylq7zGoVW7k1CyGOQuMqATYvurRBswXGSzjziNSF8xnccbRzVS79/VrP5vc21
         VCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=idDc6DGD+fulN+NrjDdkqMJrhpGOYDh59D9l9UTrFSQ=;
        fh=9oCR8/Va4RXSYJZrAfu6oQvIN0EzwrHPg97Y00tjTv0=;
        b=OPiTBi3CH0g500BxxtWvlWyenJgJquUJcvLWyKCJq5HTIBPj+w/4c1Pay2IkaZ6DN1
         o8ol6fU6zAq/5ptsn6wVs2tBLeO+3HsW0HVWDcYyrKIWX8yFV/+vH2+s8U0E3i20bT+z
         +CoBAI65S5dTiVqKbdzpTBH9Sc4FDtRGUEe+duN/lTkkoYn3dfv7LULEMmFuzKVjd6iW
         qp1cepvvVo2slMK4QZxLZ1ziG5p8OlGRNFbb5r+MV76wbSOh2scQKFK5kPfQoqBu1QM9
         q4A3/dwdlTI+EpBn7djvd/gdNs4NVFLzq/HZ3zMVpR6iqbgJhpY5DCA6Vx/uBIqrJtDL
         /qAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792703384; x=1793308184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idDc6DGD+fulN+NrjDdkqMJrhpGOYDh59D9l9UTrFSQ=;
        b=RiP61PyyqvFmzGap6mZYADrfyJFCoZdcIxfVETBjgvtWUk8hQmDn5ezf/6F/miyM0l
         c/mUTVvMphLC2ycrz91ctggZw+8vQcoV/Ms5hDA631hl/vvwclQDxYk37ky2Iy8J1CP5
         m8YpGy9Gw92FUn/ip3mcDcXBbucdwfTfqGN2RGVB4W3cY2ihNWGof82Siv+yxuJEkCcd
         vY8nT+PwYb9kaLqCNemht4/KdLoZzNwVJUqKZ2hbttCAgLOs21OmRGNGsN2+EHWTuZWp
         NIwJa1Nbvx0+ZdgRE0PkRgmgcCigQ5AMhuKYgmn12gfkJrw/2Q5ZLfS6ivl66Rf74xjL
         v2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703384; x=1793308184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idDc6DGD+fulN+NrjDdkqMJrhpGOYDh59D9l9UTrFSQ=;
        b=UwRbY2CJLg9kDxQp6L0Gf/d0aTQ9ET30wyCexCI7S48yjzTSW/BBDfdyEFRxM+91qT
         ZzzVvV/uQC8W8wka9eIttMWCFNF/9YKsBJVza7bwvWO+T3q6Lj8wfatEom2KwsnFNfhA
         ttWDko0wZrPEmLadNUNc0XK+p+X4RMrFQMKrGt7YRndpKVarUZNXaSGTbpcEO4vmahRJ
         Q4IGKyzpjpVoXei3L2L7LdzOpYW4t43nQ/uAU5kigTAjJkNf2W+zw/3f3m7aYFpld3Dr
         cCztOHmEqtujyIumHmSekME4UKqooYRMpRgIfdGWcCi3l9yNq0X0SMLBpuEUftUW83aA
         LW1A==
X-Forwarded-Encrypted: i=1; AKwUvBzHDEQxYRTbhKB2qMY0MVHzFVHY9iW6Gnv4TfLehEgRHXpu1BGYhavuN3GjcDlAgb0bv3m5/j+L6K2vPMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGZ00P9PKl4vAL464eO3JSJrnzIN9ay/ttd8QdXsQ9w3C7/awl
	KvbxNt0445vO6ck8cxV02Qlkupk/mZNgw2qKneOKp7yJeq0x2EQLlWLaHDSVMrdWNLADg83AB1i
	En9/72814FbFrcJuontrioq6z03AqgOzwsw9RgqVz3h98voSLuAJj9Po=
X-Gm-Gg: AYBFou3n/MoWGzrwT52wvb02RfVcNAxJ1tC0VV86xDXHSJokjHPu8acESDEqQJINeek
	VHocsl5qALE6+ckoD8Gm2FQZxS8/OXgLChv5EyoXRjPNXcbzc+VjcDGgNxW2iq6xlA1xmVZ/u3O
	9pNYoQlwIFQEPZzRG8/tapT5tUxjSl0xNZwa35jyEDFJb85NOUDJbttpggQZZn6Azc/zbeXeuo1
	oVmYrx28NclwJ6nffxLSc8LMU8h2rhcXZRcSIpqh1WJeK8XyZcyzFxnOZnU0oq7VXFFL/Hi38A0
	kYOFEpkM8+TAgGbfY22AIjULfB/oweJGfrrO8JJKMiTxWH/CKP1KanOtiX1haUb47U08SD/Crou
	XqQTL8cU8i112DBb2tD7Wyb2sIyPhoquDLMMpI6XrCz3piYJwOnT212++OhiHTtB/monvb3ZT/o
	2IDa/O9TwwUZ+z6/yUmZmDP7Ur3XPIJ7AP4sGNMl4l6qTtthigCY1YBczB36Em5+e6Ln5DHxzZ+
	wvvAaZVeOfclTFvXJb3b3hj9UctnWnv7oASqU3LayfHKfFg5+nt
X-Received: by 2002:a05:6000:3111:b0:48d:f324:4621 with SMTP id
 ffacd0b85a97d-48e387ed01cmr61411f8f.52.1792703383272; Thu, 22 Oct 2026
 14:09:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-5-dwmw2@infradead.org>
In-Reply-To: <20261001202134.33929-5-dwmw2@infradead.org>
From: John Stultz <jstultz@google.com>
Date: Thu, 22 Oct 2026 14:09:31 -0700
X-Gm-Features: AclHuK_PmPEE0hBLIrheAqDBeCPQG2A9gzjeDHX2Ls_ohRpLNTKpvF1eJqvzhug
Message-ID: <CANDhNCrEYwNszuUqceV-+SYZ=tSY4eOmVxCP4fAMEkNJNdP9bw@mail.gmail.com>
Subject: Re: [PATCH 4/5] timekeeping: Reinstate proportional correction of ntp_error
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Rodolfo Giometti <giometti@enneenne.com>, Ryan Luu <rluu@amazon.com>, 
	Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:21=E2=80=AFPM David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The =C2=B11 mult dithering is sufficient to keep ntp_error at zero once
> it's already there, but it doesn't do much to reduce it once any
> significant ntp_error has accumulated (e.g. from frequency or phase
> adjustments) =E2=80=94 it can typically only drain single-digit nanosecon=
ds
> per second. Commit dc491596f639 ("timekeeping: Rework frequency
> adjustments to work better w/ nohz") removed a larger skew because in
> a tickless kernel, it would remain in effect for a full idle period
> and overshoot. Now that timekeeping_max_deferment() ensures that the
> system wakes at the top of the second when skew is active, the
> correction can be reinstated. If ntp_error exceeds an amount that a
> single =C2=B11 change to mult can drain within a minute, add an
> additional bias to mult to close the gap.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: LLM

I can't say I've totally wrapped my head around all the details in
this one, but at a high level it sounds reasonable and nothing is
obviously sticking out to me.

Acked-by: John Stultz <jstultz@google.com>
