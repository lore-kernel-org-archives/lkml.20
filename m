Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487160;
	b=EKv1v+xjCp9fUxUQdnWOtx36r5EVLEXQWxJI3FpcAs0hz22uS8oTIZrM6GMVRzXH2jZo
	 H2WOy6djY3lAjeZqTMs1khZzopP3Xr6VLAfZ3SbAPj0EvCVCVWzjcVZlQv4zUq4lLZTyy
	 cuWG8miHGASCxu1pIBcIWisAcAJQi8YGLae/L6iwLhs8ObkWoWXAhTI6RUJNI/G8DChGi
	 3mPO68nuTqwb/CTipPHp6jqDGseABnvPDYpoKGgWDdvmj3R0RQM1mT3attRkSErLHCecW
	 PwWUPJp4pWCbwbYpTjhMcwcbY+rB0efAWSya8YBzOXAIhLBBG6nT6KEDSrosOjbp+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=+OzKgdaaBnPfV5yc0/wuuWajJJT+0oOzbHEMb7GwaoU=;
	b=uqDpjrtOrztw8QxSU4R2NHzxbWFsEhE69bItnUK+e2j+Q1r7y3XgySglvhBvauQyMRa2
	 2FH0pZhAYyLfM49aG1SkQ8f2rRs3M8lcY2rJ5nIqHExrpVaGOCW3yG982ue/N7BGzTEZF
	 kPBQ89jJDqXrDax0FDTXUfwk+vAoFol/934xJ4yB0bJRWHqdaM0kOQI4SMkY2uqdG71ru
	 bi10AinHIpgirbN1DPRoXu5nJtP4hNIu33pU0nqz5/bQVjMpmFurN/ZBm55vm4wXVse5l
	 wSleF/8Jl+4Np99ulY8HJa5TCqqvDzOXrRhlfHqNYsU9dNdAJc6yugmmodHdIS8hjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOv05ia6;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263260A2627
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5263260A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOv05ia6
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16aedso11602705ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793487160; x=1794091960; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OzKgdaaBnPfV5yc0/wuuWajJJT+0oOzbHEMb7GwaoU=;
        b=jOv05ia68UaXzOGFYYheGtAmkHq+O8IkgQ8xSRv8VAoKgs8TE8QgNj29TqiX0b4GZ+
         BaVmJ65lrUkOaeAydV1x1dhkjf80dyTDNlVzWchF0N9RrTY8ryiHY4JBBVQccaQGPo29
         0C333Ovl3iF338f31XSjephfl8scKoz3NsWY1jtXejWHHoOCDWB/cUL/TFM895WL3Nol
         4H9AMv/hS0HSvpHsx7UpGIsUujQfcyPDJS5emTIrKKm9RfezbjBYWfmB1lZ3jFl9T2hc
         7o5Yx2Mq74Nvt7JcUNFqLhTVlesKoqIU6TGaXqnUHlhGxtJUJXjTcoLBRy1i/RlKrSiz
         v0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793487160; x=1794091960;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OzKgdaaBnPfV5yc0/wuuWajJJT+0oOzbHEMb7GwaoU=;
        b=w7GB08KItXSksbbkUkIJtXj7VxfLjlB06ehxqhDaxhpfXIfeuF3CCMBjdjcTgdiaPw
         lcRadQtUbXJ/a5cff9joT/pYJ5Rlkq3syAG9PWmdVjcWCmafl5MtEyj8j+JlLxXBnfxX
         fA5IHZCmp++YrBoenyUQt61LEf2fpWHPTfQRn9wILws68+KIzPRQCtEjl4SVA8GaaSwp
         Q9mtLGky7676nppKcOXTMUnDZ66HNeZncpptBMaj7hWCr7Aozd1B8SpVB43DVoed1+R/
         ZlgFWZQjZFOMBLGggz06hxe2oOJaW2klGb5LmLE0CQWUfyyuBG7RmAPxg+8vUUnPwzko
         9UnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjumyQMuwxTiv/dv2m59LjEbQiI9TD+4d7uGCXKAVgegeftgmloGKxTXeEt3BmryS/O9FnbRMeGPkk8do=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9aJExBphQDbhwHgTYGwvfp5V/nM1hCoTZtdljtDkwufGq5eS7
	BFXJW6GssYOVsBhmI2idT1vxlH4Fi/nZlmHt1ugcxiqT8iQxlncOV9B/
X-Gm-Gg: AYBFou2MVdqYWxEh9Hlm8Q5elLH85v6XI2ZN2zn5KX/s5qPezBwrwlsvDNSJ2zWnkus
	yI7KOSheC0wM23k52uxQMZDz6ibrEfe3vAb/ndM0jAa1ZdW96N85+t8wipDRMIwgOkj9EbvLQOJ
	M9eLkZGtYq9/rln5drYEeDGN5QZpaDYLGPdZsyhm43w8icqH5P3K+sMH6TSbX0vgkKEqEKRMrvr
	IZag3IoDCfP1+40RwbWQLRXctjUg0QmNBi7vKwtYxPSMTGzvgB3wklT4u0jwmY/Gyl7J4JYN/lG
	WALWl3dyUUNLz4jPV8Fhl81TlnBKdOKTXDkfjt9NcwHjXCHoYjh2XOsCtI3MOCxS3340yrFLzba
	AXXnCDe/qs181Buw+/e5LyUJK6c9WFr4x52NbB4Nes5SxuCwm5HoY+kXORHvyFXfyT3yrvJ8lBE
	o9/+ViJ3BrXqF4UTrgxD/lvwdlq3HOZPKmdlQSQfcmA45BN5JaWSOfXsQT3qT4NEVZzK+idcLji
	QhyeuDj8DPHWG1NavOkRsB6OXjRwaBSAWr/kCCJQvmUkyeL82PJ963fObbQ4OSF+uCQOVJgC0bG
	rYkhjIlqzfadDWWfNlL3UVvZ+k0A+ka2KyznoKknkySWu3G9xV7in+bkQtLfnf7cghd72ef8aWW
	Rz6pQQvI7hOQPp8Otz7s3AR6rDVJSW6FIM99jhQSx3uSpX2N695wiD4g=
X-Received: by 2002:a05:6a00:22c7:b0:878:3705:2515 with SMTP id d2e1a72fcca58-8a9bf71a1e1mr5277325b3a.53.1793487159530;
        Sat, 31 Oct 2026 15:52:39 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8ac269b8805sm162543b3a.44.2026.10.31.15.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 15:52:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 22:52:38 +0000
Message-Id: <DMJE4YGAEGPX.2PIN4TJJ0AV0N@gmail.com>
Subject: Re: [PATCH bpf-next] bpftool: Preserve unsigned enum64 values in
 data dumps
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <qmo@kernel.org>,
 <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <yonghong.song@linux.dev>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20261031223617.367-1-dennylin0707@gmail.com>
References: <20261031223617.367-1-dennylin0707@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 03:36 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
> @@ -204,7 +204,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
> -	jsonw_int(d->jw, value);
> +	if (btf_kflag(t))
> +		jsonw_int(d->jw, value);
> +	else
> +		jsonw_uint(d->jw, value);

btf_dumper_enum() has the same problem.

Fix all in one patch:

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163..09dd428 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -149,7 +149,8 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 			    const void *data)
 {
 	const struct btf_enum *enums = btf_enum(t);
-	__s64 value;
+	bool is_signed = btf_kflag(t);
+	__s64 value, val;
 	__u32 i;

 	switch (t->size) {
@@ -157,20 +158,21 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 		value = *(__s64 *)data;
 		break;
 	case 4:
-		value = *(__s32 *)data;
+		value = is_signed ? (__s64)*(__s32 *)data : *(__u32 *)data;
 		break;
 	case 2:
-		value = *(__s16 *)data;
+		value = is_signed ? *(__s16 *)data : *(__u16 *)data;
 		break;
 	case 1:
-		value = *(__s8 *)data;
+		value = is_signed ? *(__s8 *)data : *(__u8 *)data;
 		break;
 	default:
 		return -EINVAL;
 	}

 	for (i = 0; i < btf_vlen(t); i++) {
-		if (value == enums[i].val) {
+		val = is_signed ? (__s64)enums[i].val : (__u32)enums[i].val;
+		if (value == val) {
 			jsonw_string(d->jw,
 				     btf__name_by_offset(d->btf,
 							 enums[i].name_off));
@@ -178,7 +180,10 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 		}
 	}

-	jsonw_int(d->jw, value);
+	if (is_signed)
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }

@@ -204,7 +209,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
 		}
 	}

-	jsonw_int(d->jw, value);
+	if (btf_kflag(t))
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }


pw-bot: cr
