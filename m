Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6482455C334
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084347; cv=pass; b=R/hE5mWkAiEDq7cl8+lZ/QVMj4Wa46ekeTCpiKOFp8PvPwRkHYtaGOCvbKTIeNAecriQRrfU/hi3Y8ip1vU5PBiiKq3mstXK803zKLRXtIm24IQ6t58AXIIUSeq7xmIUQkENGJ/2KET59PGanaRUnhcG4DJkx2DNhzwjcKpIS0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084347; c=relaxed/simple;
	bh=E5wvLBgFqxSZGnqXC4JtAllV7DpqQrgFZ5hJ2YmKNEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeIqvoLTTcZIp6UHIRdIiJE7BUcmPOLHVrG1r5G891LkF463aClp9ld+ML8fjcjN+/L65I4qEeFx89BQts+C4VZXQpVzWSFBvEG4TXPXsPBJ4abJVo8PH/2B0LZZ76VXEO9/dIdBcE6uQirRgxHnFtV/wn9xSpFGgp8PDkq4A3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYPPSb7D; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYPPSb7D"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso2462745e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084328; cv=none;
        d=google.com; s=arc-20260327;
        b=FIuPu/xc3xOemogPE4b5Lp1vipzE6uqJED7O6UGmMGXF8SaKRWT7dbVctR7+VpGECv
         tOLRtym6Ov1nWOadyrckBzFHXFAO1nFUcDtBHY1mKn5Fgp50XCSHy/ogAWc4Y7Mnu4DR
         kViZ/SLUzu0BPPs4oil0IMBi0IlEAtG0I6CkFT/Ghuf/FkbhjQ5Or5z6XlNamm5FrovU
         ap1OKOn9f1uUSRL3RrFVvVxKMNYED+jfGT0RwjvcqctFNPnXhIxMHSMAzpzl3ZhjZC4a
         xvN4X3b+Q6FBMhIceKGSsvMTn4T88WC7VzPtC3NkAxLSRIDwOhNh5NBqeEqinaKmuXuG
         GjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5wvLBgFqxSZGnqXC4JtAllV7DpqQrgFZ5hJ2YmKNEc=;
        fh=pMBeI7PjdyzBEU/VrTFZVYnd3G6qwK6bnd19sUHm5VE=;
        b=BOUg/R1AQ2ViDofPYmKDpc++hBe63VVh6Ysd6SDSYrnpkzssAp3gzJlZ4zRBfY862g
         d8Gb6qfOr0i7Yt2uqJ1JzHxrADTEr1jTWzWClBhS88hPV5l0ViiBiKr0DVJW6y5NNv5O
         0piWNRy+MvoUpw40QQzdEKNVswQ4s0h1nkzmM6wqos66ELu6jYpOOG9h+Cp0a3d+qK2E
         vDZxhfUY59mtd4ICdOiIsG64FAp0oe6iP0QK8ILvEQMDbMTdpSuZRuOvdQ8x1lCmaxk3
         BqhTG/4Ge6S9i+29qonOBzjuLxnEGWt28BTfU8b4O7EcRQnaSI57q0Tf3S8SUoIZXjln
         1xyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084328; x=1792689128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5wvLBgFqxSZGnqXC4JtAllV7DpqQrgFZ5hJ2YmKNEc=;
        b=lYPPSb7DnaF5TP9DpfDgogPGo4xmxQDA3OQLM/B/QDKnyWqLZQtf4hTqe/SWjHMiWE
         jShvy7RC000dYc4ifhJrGbHtr6F+LMS8ckLq3a6GAsF2xHtK+nxgIRwDnIZFPaEqw5o+
         4UNp0s0JqTpIKTR3ASXrk04e19PdpF3YdOppi7uSgFkLgtF7G/0bRJcPbeDibY4/28R4
         ffWpEc3Hz5YY+6f8JcqvFdjSUrkDboqRkDXxaV5wRgW3IJ+8AD2p30LyNAtyVfGIeg8t
         W/SP/DBbsJdPTS+pPhtX3ejaFOSgQgh98LCIbjgs3tlv2AWLcUTH+jvnZYIxzhPL+Pae
         0WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084328; x=1792689128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5wvLBgFqxSZGnqXC4JtAllV7DpqQrgFZ5hJ2YmKNEc=;
        b=Oifdl8dA3JpyPZJkUsK5Aa5+DyOK+3Sev/1YVD2R2tDQC4L/+1klNiCF4SDQIXveTi
         8+HNFsTN3BxEGsrFtKcYbZBXu8kMp7epExP0tezm4lsohVh05pMbGmbFjJqXiHRlDuLs
         X6C8eKFZDmybjLzi4NAP2XbsTEJst62Jj3Kbx2S3ulICrZqZFXbiijz03W5PmR2RVT5V
         AyVdsW3Nxn/tD3LcqGL2E7Z05760Gsm66GArGFrVHuOwVhGUJrEIm6CFkelkIVRzHmNQ
         lhj020TjEbjALX4CX1cQQAQZWoC0tH82ghi+9Iz5u3nMbGnr7bmFXogJPEYraPjI6ckJ
         f8LQ==
X-Forwarded-Encrypted: i=1; AKwUvByR8O2ZUa7RtHyvNA1M4Q9O2wr3y2UEYtjMPeoWYDv5FkUPCqMyoiL+AZk3GFwPSHqywv626P21EBgusaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+DcozxwVYyh5KSxqEOCFV9pISlz4sqrPZo5BQRwxS/zhKlbhP
	UL6nFZx+GWJAbv7Catcw74IFJjBn7ZJG7AxyEGY7Vr9GAI/ODByOYz71+q8FsmRVfFVW9R7no0/
	5bHbKIU7bwDby8NRq5oMttcXAMLDIsNB/aQOCpCI=
X-Gm-Gg: AYBFou0GgeQ7eZhGqyrC8yFzsry3HXQoxox7O61wd4UKivtEmqQ4FDooYu6wr5/jl0u
	mzous3u64eaPuo0972u3IC9m5UBv7uj0G6KVHieVRGctU7veqYdH+JdQBZMW61pGehRn0hSJuvP
	VUqIlr2oddCI9ShIGfqx6YsTy7Aew+Hi8VJ609GtFXfPWII4bSGkHpC5/+e/iafYxKKXVcbjYDo
	537+kDOQfVJOhGw4qzYxAxiaUBR4PMXZmf7SRWh34hP0NcfUa522Kf0HSX3Xx6Qm7EFYxuDoR2j
	JWPsN0L9+LzyS/SdLFTrwbh7zdnAwucYLcMezVmgjb1OpH/1OGMre81gAFQUiKuotWnP0CIZT4f
	KcCAbiOANGQxC4n5B2jPSnIqE08pxTbt8V3TloC6TPZ12MSRgvxGBQfU/DiOjB8ukWPNH1O8=
X-Received: by 2002:a05:600c:6c42:b0:4a1:7f96:9b42 with SMTP id
 5b1f17b1804b1-4a1c6688027mr10170115e9.15.1792084328256; Thu, 15 Oct 2026
 10:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261014090821.227366-1-jiayuan.chen@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 15 Oct 2026 10:11:56 -0700
X-Gm-Features: AclHuK-yQypDW08qkRMvF4aeQpLcp1NcljdYGmGua4TF6Gj8KnRRVGox3kNtLVs
Message-ID: <CAKEwX=NE51ko2U0-TCd9+sAm8NKeGeT61HFXTnnU_q2Tn75rCQ@mail.gmail.com>
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:08=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> On our production hosts we saw swap cache only pages keep growing for day=
s:
> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
> swap slots were held by folios that no process mapped any more, charged

That's a really nasty situation.

> to cgroups whose workloads had long exited. The only way to get them
> back was swapoff, and with other services actively swapping on the
> same host that is not an option.

Is it not similar to cold file caches?

The recommendation for these kind of scenarios (for both file and
anon) is to adopt a proactive reclaimer (in the same vein as senpai).
That's what we do internally.

>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>

Code looks solid to me otherwise. Maybe include some numbers from your
testing in the cover letter to verify that the swap cache usage drop.
