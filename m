Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905BF3ED3BA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855620; cv=pass; b=Nl7xSo808yMbLO36DwQDYvju1A9GjESDaiOR3LjhOzdvugcyZ8/tmEM91EgrznL9Ho0cbbJQVbGe7eyEpOQjUgXqjjSkYC63Dv3X1elDIpzMlBVWMu0zD1Aif72l1WSzMqqbbG5gaRs8Jxo2tFuvU8m9mt0uHeAILyoAibo7rrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855620; c=relaxed/simple;
	bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pltdLjgF36H2YKXqYNTZ8mDo0mDLHK7FxFlNQqQo6+PPpTTJjSJuA31hKh76WdS2IXZlZnfzUtR3tDCFFXO/GghdjESvtzAOPbitl70ThIG79BcHplyHreWnS26etMG3VUkLwoUGn+NuZxnnUk++RYcXq0nRaUObRmFucNVR33o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sO8ebbnR; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sO8ebbnR"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9399997417aso212842885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788855616; cv=none;
        d=google.com; s=arc-20260327;
        b=qsu+fWZJH6mrFb9naGYSZzjSLCBgOiY69f32kvTMhmzf4YF4vlX7RzHCSgdf8tWrQc
         69L7pjMe85bGiDrJmi4jlmN3DdJMEnyPGRqfLq4pmy93dl+/n3MA7COIuowpyulfQw/T
         1Xe2xEgWURRy50YK8sh4SSaeqKZi49xItnvwhojPPCX7dD1VTl335vtjinSXKjE0CwnI
         viC4rNC0erTf1BIam2W2sXkeQZfcfJ6JQpMb+xS2Cn0Km63+ZouT3GKOLajHdejcx3pt
         ZEo6eslXF2uX1+6P4CRebuQkidrHPsq6X9Rc61PW4aEtJ2wZ8pKY+AGxQ3spG8k3T4ub
         bhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
        fh=iKkPhd5rL4Bnnz3ntwJtqF6csOCPFelQZi2azLaE0J8=;
        b=PiFFmIUeK+bJJsxb4iYoYyYbpD5ffb2xWIJG2n3+AKJmuWaCbiga6j4Lu3goPGi0+t
         rvWv4os7Ni9OcAeD4ZkFiAd6tJMMKww6DAumuYVw4Hw5FlOeBRZUjfuZWnGwtGHlZ2Nh
         0erMvaQQhDuwXd9A91hm+3LvaWF5NVaGhInbZjK+cLe2LQddTeka/1F7Kbq+sDf+Nvi1
         tCHDLeBZK+pky1CfUMC/GC9xZv/X7IhFtgREEMM89KHThtxMgCGn1DJ6AggX2vJ5pW8y
         4npZjs0oeMhrMSLQl53A3IPxtVOooyuYnt/WHQkELLUkGbUg9eNlciC9QbdG6kYKfpuV
         SXHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788855616; x=1789460416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
        b=sO8ebbnRRyogAoRUoEKrDUIrV9/y3WCeanjkAFp/SRpg/dbdT0cqX+wN2pNTpuFDX/
         +d9L75Qm2B5nKiNt8BOFJ7xKu/VPzEwH1XXltWfXF8MfArLid1o/wwxXOMSudlwqkf5b
         iv+2MJpKykr9OOcDdb0iGuOtCwXDS97rFgfbVWVftInFIhwAN9mfYyr4Etkr2Xcf85+O
         dmPWy+RMlAO6KgtbEr/+LskeSzf6StieEdPwll9jU/hP2DA4DYZgHWhxmymgCqWysBBS
         sIjpHQv5bpjIFh8kBlqHDCsL/zGpVHKEz0AyDi8msAhBSUvwlfMKCMnH9bC3ntPrEys4
         IJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855616; x=1789460416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsjTDp8GxgJOwpED1Wg/Qo5pHHkBB4Ysmhw6O6ZbUK4=;
        b=f4Z1lr/QABJdvKkUI+aI4BlPWuvknQyaHf3puviiP6U5tT8Yy1gXP6ok2L2ZwcCNFk
         Tw+gr012ij7gijytDMfvo2d7MGVgcaMpmZSyKcOSBWwecjzXGADa7IOFzgl/Maus3zYG
         yrXpwHYbz2afFSf2A550KVLSDiIAxOPR0R/Ydj0vPh9BrSAfsiv/c2Eq409rOMUOeYN2
         EpvsrGvuMQDJTe/UyqSNzVfcykloTllZwX9CXCnfMnIt8o0zqrmh73GBGuncqACrfr79
         V0xNbXgvz+33ZPmczrmuQbXsb08aXzDOoRyyTIxrjgYe/aGkInEzmzqSSJmHo83bVB5f
         bzrw==
X-Forwarded-Encrypted: i=1; AKwUvBxwBUSkSg2EhXmr3/y7uUB2h2pe+9kJm+6qp+zBAHcupnzgQtGPz6Uw6cwHllep5ANXcL/qXYK06SbCpHs=@vger.kernel.org
X-Gm-Message-State: AFuF++nd48CiC8Hk8r9BAvJx3YGh/tyOo3NtkGju5PdWfRB4aOZcQPuu
	GoydSiJRMLp7mw+527NZqzmWukI/yiXsaxuV14toK6qHggNk51zUxKMVQ5dKwDzxF9+p1ixxSTe
	I4vFeGxB3KuD9M379dDHY2hT2nxqMGZXzYNK2jWG+
X-Gm-Gg: AYBFou1A8uUWhRcxZnflSgceN1L4H3SEi9i94g7GyNHvxYKChN62X8ZdGbPG3+KOmB9
	gLCsCnlyMeqjD23uzgGCIco/TsxXguxnKvFjIX9a9wqz9pMLHadp0+kPaVRgBpWoH8O3QWCXYwb
	eOSRrc7UuWT8+A3BNB6plN/8tth+jpn+l+8YZ2fpS1Nhkor+JcTgmqotHW+Z5ObdUgH9Tfp7VUv
	gdkNQK99wOn6BMZz8jO9F0mczJ5tQ6IToYY05P5/1tBHkT1ql4SpwOrsukBmycQN5HjTHWBsZtA
	okP3j8Dg3cIfuiOwk8Zd7OQw8e9e0ISiBb7K1LsRJYq/JjmtvCgkg6PFltPANEgfV5EzBLd/Si1
	NVR3RKwwXVUikNm8V9ufyM3phPOOQ2XmTts+cRDH+PWPovNU4W4WftOGHcA==
X-Received: by 2002:a05:620a:2855:b0:936:eb7f:d2c7 with SMTP id
 af79cd13be357-93980400609mr3654539685a.27.1788855615776; Tue, 08 Sep 2026
 01:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908072135.877364-1-qingfang.deng@linux.dev>
In-Reply-To: <20260908072135.877364-1-qingfang.deng@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Sep 2026 10:20:03 +0200
X-Gm-Features: AcwNN1Xe-V-EjnVcuPI54J8HF_f0_7IiJQXu4AsaIKhTCzrczAlMe4wF4WaYDBY
Message-ID: <CANn89i+w-txLUf9KbUORYy03x2GS8Z=Uroh+rqiBKztdc9hqFQ@mail.gmail.com>
Subject: Re: [PATCH net] ppp_synctty: ensure a writeable skb header
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Kees Cook <kees@kernel.org>, Tom Parkin <tparkin@katalix.com>, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:21=E2=80=AFAM Qingfang Deng <qingfang.deng@linux.d=
ev> wrote:
>
> ppp_sync_txmunge() checks headroom before prepending the address and
> control bytes, but does not ensure that the skb header is writable.
> A received skb can reach this function through PPP channel bridging
> without passing through ppp_start_xmit(), which calls skb_cow_head().
>
> For example, a PPPoE frame may share its buffer with a clone queued to
> an AF_PACKET socket. If it is bridged to a synchronous tty channel, the
> address/control bytes can overwrite data still visible to that socket.
>
> Use skb_cow_head() to ensure both sufficient headroom and a writable
> header.
>
> Fixes: 4cf476ced45d ("ppp: add PPPIOCBRIDGECHAN and PPPIOCUNBRIDGECHAN io=
ctls")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>

SGTM. I will fix pppoatm_send() in net/atm/pppoatm.c which has a similar bu=
g.

Reviewed-by: Eric Dumazet <edumazet@google.com>
