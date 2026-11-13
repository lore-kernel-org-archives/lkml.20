Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610713;
	b=vItiYEfpf4DvQLRBtt1ywV/fkPUX+lyh7jZ5itJ43CIHKQLG8IlhuReTjErghDo6hZ7p
	 MWXe4TexYIxDHM1B/19aXOxJgkFnz88X7FZehBHSmcdGKch/SKkZPjpA0ezAwXZW8Dloi
	 8oA8WKCQA+goAFQL3mfZxw3oO5eAV9o7lsvxqKZyaO6r6Qsqio1KUqJBddrAhoLqc6OjX
	 zwRh+VZSInRCnJEi3KdKW9XMfx3atIrvS6qJvkWVrCdWJTd/FlteTFPRD6WALA4nxu/Fc
	 +Qurl3FqFn6ubpNIcvduzpsljRuskDaPcRgoplk8PntS+RAUaaN6a+DVI/ge3QXrHlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p9AJLkeNoge+nOrroi09CUXkurgmO09wLDwnTiHFkBg=;
	b=hE0RTEYtsKd7q+Er6fCHfIZCWSR6UusAq+nzSDNmHdHEK4nZvdfuisYWl/uGX088Uw+3
	 LEcj7r2gSnVKufnrkFHbAC1doYgLKP6P3gw/epfbqRukzLJ3IoLR3oNFvpNNgr2tJ7Q1D
	 nLAJ1AZurOwrYCwPbYaXlis77cS+EW28+lnj+Sw9uso8uxwdFK3h4LeG4BZAjAiG5Oe+w
	 SADBlDeygHKxrrkXGfl86WcQDRjGIqtfkB4M6gkIYRYUVSFWSTJS2WuPyx5hqey4jCutN
	 Ix/qIMXWYCnJn4bU1gDWBIPvrdxfcjUjetKQcZmNiMhfotUq77P/Pv/gwSPo9O6fArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="dh/eQaJb";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575CB606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575CB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=dh/eQaJb
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 475CF402C9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794610710;
	bh=p9AJLkeNoge+nOrroi09CUXkurgmO09wLDwnTiHFkBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=dh/eQaJbKOgz4ZnR23daGyWgbFovjQEAI8wt6Pg62PU6ilvIdy+OH+jRvgw21V6Jy
	 371Q90GvqjJSep8zUR5VRUfp4KEy1o3azLmyIZmdOoaIvTV/uDMPs0V5rQQU6n5r6n
	 dtP0HYQIM3W0ABAtekLhcpK9NeKqZL+1qpwNbMbJpDwQI89lgBsOnE9Tt8qJRev08W
	 ze3x3XbkzoXWqovsbyaHYWQBHt7b9vkZWL8VvFIoTuDDx/iO46gkMEFS4OF/d2671N
	 fqgf9uFB6RVObrvTZPlravJniEsbhXvVJRZIqVuRrU6/sonnmNKsuDjp0WHqy+I0DC
	 vWL/8R4XriACEcfwYBKn3acRGaMF9bfb18W4Oq4naW7maBP/flj3tspE0RI9RSt8/7
	 AzHE90ujw6EHl8RFi6Six10dNk/5LpCptt6F2B0piwW0vKHX2kDaL/34x//6ShiF20
	 UoWu/6n2A5iiBDktp+OzbJshQusATaouhejGzv8eW0UJzUEKL9P2XnNn9y4DkPYP4X
	 4dzfo9Keni4Hd5p4tBjdcqUJ/QqN9V89UKHAf5HX/yKFELtxuwLo9HK0X07tn6UJvX
	 VL/n2Ocixz9vTSfwJRsvztTU1rJfcM1m2BeirhE3SdEXjbY0rb9tNn6djWFjiFS/EZ
	 T5aCr8S0CVjf/Qf/J/HbQ3yM=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso1381393eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794610708; x=1795215508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9AJLkeNoge+nOrroi09CUXkurgmO09wLDwnTiHFkBg=;
        b=e98sTxRgF4MfVp5NOU/ASEJHPR8EWd95wgkDZ/8n/+zyX2YDlt8KXxM8Mh4b0BvImy
         T9Q7NYJ/EcFfK3Rg8ewoJuH9ttxpcjXZhfJMAgjM9U1icWnE5ch7/PbGL0ub01dwTr6/
         bSn55SkPIJsykOd5qBdSWmi2v976e/rUt/Cgj9WjrBAIHnkXmY5AEMTylcAAT+X0YNxd
         pAgXhFuUmphipx2f+rf0u/MIrjxXIAVThwMI42N0y2WU6G8Q5Fx1TJy1rV/Cpjeg+4zX
         LvvYqalCIx1ol0YpX/kJXmdT+IxRxUdaHJvHYhe4+QEYOFztLk8KGn5s6Prasb/a9aYz
         D2EQ==
X-Forwarded-Encrypted: i=1; AL+hErFNStydhmPWhTVKGwIQfeJXuRV15kn9jlXbBwETH1Kdh129q+nZNp2vvcUiWQHhnJM0fQz5goHNEv5XJZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oe6gAj7L4tD9isMF1aOknJvnWF5UuaLV0RgPm+T6MJoXBbQV2
	Q4q9hZZ09Mt5dnmWPF6/lVzq4mkRodiuWbgM/LmyKhzfyowL68+RLIX6isCoSSoC8wae5z8o+GZ
	1t722UlRlauE6uQgW7eKGMR0xBqyQcNyEMl4DQeGZSMKNtSfWQl5Zno2spZNBWFEmx/atRtmXDx
	Th3JtiperhumWCyw==
X-Gm-Gg: AYBFou29EP98q8nczTdzGu81fduofH1A1QeW6808q6Ooo3a9ILGsaD1fTYpltEBV/Ri
	DRbnH8BPWuSJStBOTlm2M0MfKEUNA8iZ9f261E0Gia3uH0bmm8B9GQ1euBcN2TNLKTgBepYgRXM
	91V7RQk15wVCj2AbHvRLrVWOrM5kqziYbEo5c3N9scULdl6ULn/bWpOzjnREGtrTk2q0qOAkWLR
	sD6LwaXbXQXdnDRqe8D8js5UY9O6FF68GbQG/71iC/7hBo9uIkYZSUAZonj4LGDVP0GQZFk34mD
	aEyIm0zDpcBrRWOA3EDKG5SEc30adiURTXHBPIWaQF5vdfvGL6t//9fLatuzJ1V2i8Fip1Lcb8/
	xnuxnqMW+NEBKj4Pr3coqBQPbsF9FM+grKuUg4q10HMUPMpB69Dz3hSJA0YY=
X-Received: by 2002:a05:693c:8110:b0:377:e99a:22a5 with SMTP id 5a478bee46e88-37966a5ceefmr3173287eec.6.1794610708515;
        Fri, 13 Nov 2026 14:58:28 -0800 (PST)
X-Received: by 2002:a05:693c:8110:b0:377:e99a:22a5 with SMTP id 5a478bee46e88-37966a5ceefmr3173271eec.6.1794610707907;
        Fri, 13 Nov 2026 14:58:27 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm15721423eec.18.2026.11.13.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:58:27 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: jeffbarnes@linux.microsoft.com
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	herbert@gondor.apana.org.au,
	horia.geanta@nxp.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pankaj.gupta@nxp.com,
	sahil.malhotra@oss.nxp.com
Subject: Re: [RFC PATCH 1/1] crypto: caam - fix in-place RSA payload DMA mapping
Date: Sat, 14 Nov 2026 09:58:21 +1100
Message-ID: <20261113225821.32339-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4155D08C-95D5-4636-85A0-709911E2CB2F@getmailspring.com>
References: <4155D08C-95D5-4636-85A0-709911E2CB2F@getmailspring.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jeff,

Yes. I agree with that.
Thank you very much.

Kind regards,
Changwei
