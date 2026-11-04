Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810244;
	b=elnkmEiJQyNHDbKppvDlvYvagEp06gbegcyN8giCGk7fKPLsxW09aAWVJM0xOmNw/zPD
	 jHUzrRaOfW99YgbKpDeysV8zyM809dgG/k3ArWtIXfn8qHv9WiCA0HQlhvqDGi+efgrSd
	 eZvzBkmgxR3SOtOCqP/qjJfBRZgE+Yx9/db1USTJ6P8j9wFqLusJ3UsDYWu2GulrKn4JZ
	 fYXDGQwiJxehS8r1XUi+SE552L4smyrQnKhf69yQMDuUfhSB25GQ+dLKwaZSUBL9IVXiU
	 wHvFgmFDznO20F/0i7VmuiVJ5GjiM8fPrFvMmutRWMWEvL8qXottk/C+ny0rpueKB+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kOH9xJas8+AahnE/juo87CvpZQxHzo4/Iy//5/OPJsU=;
	b=xcG6qp8QT1t0ZfM1RWxHXlVDGkDkzJgikyJtT7drhi1uWcxo1BilRayiD3PyrDZOuMtg
	 /nUGgiycQHFs8sRGZYX/07CjC2V0FgIc8iqh/x6aAkf/1xH3HPl3Otu6tpWTpPC/xTthN
	 Pa/udhqT23IphWK3BBbe360AqKfrKCrustjGWhSW++DA4TpZSjgFbbihUPrlcK99CDwov
	 XJh27SvX8hKjQWRkHfUqkZVmOi6We0/KPe9jXtiDj7GNVA9/W1/8/51RH8qnF8E4HgCIM
	 p+kceFAZdAQOSvNeXdF6fUH8TG67Jy/qsO8fX6CSUQfgZRlo9MixmWuuOmVPaETQRWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcNpY4LT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88BA606D826
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88BA606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KcNpY4LT
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7890865e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:37:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810242; cv=none;
        d=google.com; s=arc-20260327;
        b=AtOoHFDb4nATDl/x90cxBsvovrJnRw4zZE7+qowss27g0LwOBrSzLl5rjPBhUEy4ro
         qY0AAhTWArWC7uLSyqysFpAeFb5butMX+6CwuLHGnP3rgyE0PM1AvUTgdnKZ1/npQLAk
         1J2ryKt7xtg9ybdl8ZXns4ZJw0uSsPLks4KUA28IlRNe9S1AU57eWHfjNMwsQbQC8CFk
         n0+beqlT6mgPJ+vKeVdkQXc+Pa8q4FkHmbUsglIfINLGWETP/4FyP8cv6pOlT7Chmmyu
         i247AxQ4BqzFCNGzt4LPonB4MT6D8SKYnFVa5YA2GMtp940z1IcptLXnLmLTCLwrcfCy
         Rf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOH9xJas8+AahnE/juo87CvpZQxHzo4/Iy//5/OPJsU=;
        fh=GYyt/aycVxm6Fx+G2NC2n3iNdbSwx9d73Yk1DOvJu4A=;
        b=CnGlVzt+icxtQI5DloW6QuuXdWobCGDSg8fca+HOHneJyu0EKfeWImBWU47Lw8KdFJ
         jrfSCpsutfeoCTsVdV7uqjiDe6inqP+gTja47uIJpL2C+/HaTzVfOYqwsL5vgQh2hhjj
         Dry7qcmEHCPWs6zlGPhgB2HoCZQKqzaJDljAXAdtBsHZSKA2OlQLaBCIRBPNNQbZC3IL
         Q1inApsPODEZQs3vTvZ+6Hh7AV2t9ai4aE27OZGxmO55opV1R93JWfE9zSEo4fFHnPXQ
         lfG2NKwxSWHh9BP1UKnjoyax/2UXXeVdLMi1AhZi0PrppZqVTFXhWdUOD1PomexegbCF
         3zdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810242; x=1794415042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOH9xJas8+AahnE/juo87CvpZQxHzo4/Iy//5/OPJsU=;
        b=KcNpY4LTajUYkY15evQM96oq7bDWCsojOVUtdz8fIhHjyhtmUlDr6dx19Fz4gjEIF9
         QnmAFuaRrNlGGMlP2yTxyqitzkAHNwslLXfSk4MfeObhMQitBLxTV6JDGpQsDqe+GRI3
         7oSRTSThVSyY2g0i2WoE0RUKaRQCtpasJh0knr2AqoaxsFRR3ayr/1Qy2y6UEL3tQzq+
         FmFn4MSo5GX/hYi9x7m2dycKVD7KEEtd7HuZ3IELPV/t4eYgn3PfME6q8sNXuC4Iw1i0
         bvnKFmXc7+dEutRnKGOWsqrmvVde4indjgLJ9YRz+RrG3WEWQ7JJ6pDlucGFZIc7RIO5
         aTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810242; x=1794415042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOH9xJas8+AahnE/juo87CvpZQxHzo4/Iy//5/OPJsU=;
        b=bRSXiOxDObiBY8WgXsNnsIItu8fB9OJoipPUWKB0YtS/jmc/5eeLqOhgZ640XiwvwD
         8ae3kDuoKHMC0wuy4FNAQScS2PGFtv7JldMM8XJsKwGAOLBfN/IFXFYEzPBcZF7zAkvD
         1wp05Qv/e43SPasvs7ZYeaSARgIKgu2161lzGN+eHrgrFfA4iZDTpqdpyhNM98fltDT3
         yc8otdmT4D5mxDmJyCi7e4gJaVHnhhbSEdLDHrWjOlGnJrVVDdrcJ+5vvgLO4YiddFMc
         /HT+JzMET1SM+TOMRcIKBVuCZ5AmMJtHZFCHTpd+pLQvqx0IM8WfmBc61YKh0pawiR75
         mfNw==
X-Forwarded-Encrypted: i=1; AKwUvBxKhwxfT6MkOhgGByzhTbr9zSClB89OdZJ4Yb5tzdhHfZn+u6JB7BRk0OoV9zousQ/6raGjwu+dUZXoyWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OWA+z4w/iVTnotpXOpquM/lYs7oBaP1x+1KrA+71o7PcQEAN3
	qxoVrNCKvtu8LuenCNAhkqMRBAK7JmixlpBqR5sGf+SzhXJGylKnyLh+aY5Eqq/EChO8qiNp5il
	yT6+VJxBC0OFEez0E/6OJCzz3F1fOh5k=
X-Gm-Gg: AYBFou3QQBahZx3bquBVaX2K9fLVhS5dlH4mRmxfiNun4puuGkzkNJhQxNvVA+UJ6c0
	R52riSby9zFAnTcX2rTIbI2fTSobdIMguHM4WqUhxPcwwUeIKCGVVLagf7TSNrrFAdkQex2Hfxd
	B93AtNZgil6vA/6tmzGdI3pbUVhbd93DMLN3jCInWAendBS4GoHiVEGwz20t2Kg8myCUURl+1fk
	efj1omHeSqyKcB/9WZgpOiGUal821Ik48oEATpeotwA1HBhRhH9xiMqpiFlev7cagseKYj/FOYp
	wDJ3fOuSoDStui5B3GT0PkU6f4Tz5QKSVTcRAkmZY+benU/O640ctGHVFrERMsgJFwl5F84PQri
	OoidmkIiYETRoSqvtPgGPKnguhhGovmbwyvjr0zydF6nNCmNr29R+Kz+U5wB4PLK+TnbuW//ULB
	6fKJAsp5Yvkf7+0XsNsT2ldLUxJp4QsdsUC721nUUxLeB0ukd95Vx5SN0laxGg8mYle01TFiGtR
	A==
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id
 5b1f17b1804b1-4ac1794032cmr383478795e9.16.1793810242092; Wed, 04 Nov 2026
 08:37:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com> <20261104-swap-hibernation-slots-v4-1-0ba9393609e1@tencent.com>
In-Reply-To: <20261104-swap-hibernation-slots-v4-1-0ba9393609e1@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 09:37:10 -0700
X-Gm-Features: AclHuK-ITyynx-LQrFm_lWP_ZygTvkXkWXKJmodVXCRLU9qFllIRAK9LXJR_isA
Message-ID: <CAKEwX=NyfTtr_6uM1cVcpQB=1tOFtcWb4Vdya=VD0v7XCSE2ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mm, swap: only allow swapped-out slots into the
 swap cache
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Jianyue Wu <wujianyue000@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Kairui Song <ryncsn@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:25=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Youngjun Park <youngjun.park@lge.com>
>
> __swap_cache_add_check() turns away folio entries and slots with no count
> and lets everything else in.  That is safe only when the caller owns the
> slot.  Cluster readahead owns nothing, it walks a raw page_cluster sized
> window of offsets around the faulting entry, so it can land on any slot.
>
> A bad slot gets in.  The check reads the count with __swp_tb_get_count(),
> which shifts the count bits out without looking at the type, and
> SWP_TB_BAD has all of them set, so the slot reads as SWP_TB_COUNT_MAX.
> Readahead then allocates a folio and reads the offset off the device for =
a
> slot nothing will ever swap in, and the folio entry that replaces it drop=
s
> the bad marker.
>
> Readahead used to be guarded by swap_entry_swapped(), which goes through
> swp_tb_get_count() and gets -EINVAL for a bad slot.  That call went away
> when the swap cache checks moved into __swap_cache_add_check(), and the
> raw accessor there does not do the same type test.
>
> Require a shadow entry instead.  A slot dropped from the swap cache alway=
s
> gets one, empty if there is no workingset value.  The type test runs firs=
t,
> so the count is only read off a countable entry, and the check as a whole
> runs before the folio allocation in __swap_cache_alloc().
>
> The large folio walk in the same function does the same raw reads.  A bad
> slot cannot be in its range, but the range is not pinned, so a slot freed
> and then taken by hibernation still trips the countable assertion there.
> Give the walk the same shadow test, the folio check folds into it.
>
> Reproduced with a badpages list written into the swap header by hand.
> Readahead took over four bad slots before this patch and none after.  It
> needs a crafted header, so a normal setup will not hit it.
>
> Fixes: e1e6750df3b4 ("mm, swap: add support for stable large allocation i=
n swap cache directly")
> Acked-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Youngjun Park <youngjun.park@lge.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM!
Reviewed-by: Nhat Pham <nphamcs@gmail.com>
