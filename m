Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729480;
	b=WozXxYEIsv4lgbzMzKU2CJLBnVx44ay7YIJIxg57HvL6SriBd/9yZZ9jlMjB3VFqNf0o
	 ZYwI25oTdvVFP6pYvgigso+b9i8RHTbn66poGtNWUxtzMxyhq1zPKYL2/I+0xHLhLoPz/
	 ICaU2rxxLiezGJBHRlEaOdr4npCbuuPCVgWr4S+weWO4QVXGerMcb6WbroBY8bVH3CSRB
	 o/m9/0dTGLMxQo2vAxsSmMG9qpOGBQVMscbQIZM79U5WGqsyXeJKq2gD5I0eexoBZCtAC
	 WxSlO6HjerVkeYVM2UhoDT2OP5RjSpr0rHRuZMIKqymi6Jp3Isg5abzpFD2YtyXykwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fMhmvsxHHHQOUhG1Or6hR6Sjkr7Y65FQpCjxc49anXg=;
	b=LzwXHvKnHdhkFpxpJxa/Zhagfo8XALlXZfxMFUkI1FCpeMyIiBp0+3b9kkXuZk9U6kwH
	 UiGnQUZPyHbYdfYPA88Ybgwa/wKgQwsZ8Mom78dijuyiPSyz5Q86h43jKIEX8ggbq+QoW
	 hv+deTgC/Fg7mshDc+dYs/PG+X0oCogIiRxjCyFXRcDdcwGf3e8zRNDUoPE8Yk03jFAhP
	 MAP7JTnPqfYJycj0Qjnt2djj9+fXQvJyUoQ3bPWXtyw+xQRlncZBCIZn6HG6HzoSBWgRe
	 DtqJ8JpzkE2PCLMXqzrb2IW65+Wke6CLDRSWnguTrpj5ka+rhfSWl4/HlabWFDYWp3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MwSX8dwV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvMzndS3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF7606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AF7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MwSX8dwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvMzndS3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPSrs3484372
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMhmvsxHHHQOUhG1Or6hR6Sjkr7Y65FQpCjxc49anXg=; b=MwSX8dwVtuIwiv9C
	K8JmKwZ8fyXsHU8k7bBrs0Vnr6bycUs6FtP4KY3/u3BK4iDUPa8zqwhIgj0oGfyC
	dRDce0LxASjFqINShLUbdjsGl5O1SuayvO2TA6jgAfxr3O4zc5WY6tgr8SvvIr/q
	YZwSRXjxxyEhkqWcvRdi0U28BiC8P+9H4eOTOdf2uYVqhGJdNY4NpTnJtTgtkZk8
	73o8l+yOvzEx5BD0/XF4Q9HbQ4ybrLy6ZJF8OX6+fPg1omtq9JRjTJc61IpUmgLH
	S1uwJUaTWi6XWjbTm9lmegy3a8JkFBh/37Iitp5F4iiuXPBeSa/fQkA4ru1oFpM+
	xUrLjA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5m4ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:11:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67694007c9cso8290220d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729478; cv=none;
        d=google.com; s=arc-20260327;
        b=UeJ6PySoD1y2z5/oUqSnNr91NRw4CZcvWJxbkWpiXz/fPmd97K7zAxoNxNSXa3cP1L
         Gs1BjbMW2iOVJFFpSFo4ucZbZRelk/fUTlX7i90jQJ8VD9iMIb2BQo7o5LMDW8uuHMC+
         vyJc+QY5b0vaCuuHSaWge+GcgoowWZO4VsIFA1l/Qup/jp+mAr4JQhx3nlsOSS9t6tZW
         aiRwXWEm83HAVAsyJ4JyBlFWG6/VKHH2DFWObaCjqCVrhOt7g29QyANtPCqUtouvh6v8
         wrSxihTZ6ZCn6X5G1G+vkXzKhDtyaJs+/FlP4y6AHGZCCvdTI9IbJ8S1liGnLviqHNc9
         XOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fMhmvsxHHHQOUhG1Or6hR6Sjkr7Y65FQpCjxc49anXg=;
        fh=k4XapRgrTsV8U3XYsAXhywT4k83GznFshlGqW5oDeJA=;
        b=X+szCDh75u7eInheU0ccbSJ9W0lnjNYpx4KZv8u2Drbq8PrJ2Ag/haJPQVS9BQjd1g
         KoBsjuxzMJiq5UQXxcwBLcCylDayByDASX/FQYLmNdkBGlxTn8dcXjzYarg5gZMqRlMo
         0df9hlux+fncnUB13Smy/Pn0pRUx4HxLQucWNh2E0S92YzLkEw7duYvuBB22IuT7GqLw
         y0m0Gd07x/okT0i86psjVo5/9r2zUpJ7dj66gbjHkrFsCfYGR8zTJTzSX/31uSudkLfq
         JzoZJpgZEXkrf8NOBeG6jwIKRYqtOr3Oq0FQ0nBWlRxhlUeFECle2QRZF3RX8ZssUzFE
         pWRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793729478; x=1794334278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fMhmvsxHHHQOUhG1Or6hR6Sjkr7Y65FQpCjxc49anXg=;
        b=YvMzndS3tFDi71alWZKHAcVapPA3pyQbtNLvukE7uxekB5d0G6FIV10nhIWSd0CAl2
         oEtZdFY3N8Ie3BgLBa5UDnb+nQANFZ6xA1CLjiPueEDipYrgG0FQqm56qwrnoPt4189T
         9lAKrxL/JXctaLF4EjCHjboMLPDM5rYKyfJhNiw37AuTaKcCWtD8S84hTvUk+5zSp7Lr
         lOVxy5//gWqT0HK+rEn2cQxF6DOA+CBHfR9BlWb7IJ4dKrUyqb+oHC7PdLYwTU3nTjxs
         jGMxopr7Ubxxd+h2r9ZHykPn8YNmYssH6AYmyhdnCrf3HIVNd6MbZ2ULn6tjw0TKuqeE
         krgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729478; x=1794334278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMhmvsxHHHQOUhG1Or6hR6Sjkr7Y65FQpCjxc49anXg=;
        b=2Ra2QyeHbePEk1Kliazm9vFdRcx8Xuyyn7Gsw1XTR0SYnO+6UPfKqS1radgGEkNJWx
         l9JEfZ6KWYKntL1BsffUOBehx5PN0OJ5HapGIWBD+w7evceCtFYBq0RV6XttaOFC82O8
         M51I8mw4toeGimrVBs2PFdkjzS3OtPAVcmzYpOdEmcSAgFweCaRnO3MrB1eJXPytnJpO
         R3K8YUcgmRaW9aVLJTvAe3sIuh5mu6GIsz7UvrNCZuB2AqzixX/a+hPc+6PkSP9J5YVt
         2B70FGmB3qqh/hKTfBiO0ixFRw/8rqbPUCTFKznGHpN6Yjcm1YRecD9BgBnaegql0wJp
         XfFw==
X-Forwarded-Encrypted: i=1; AKwUvBzS3kFKxB2o0rsOoZWRRGBLbpiPIaAU4Hz+iasq9WlpffTb8mk81eRYmVTK3XMqxW9wOmyXDgfT6W0r830=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r1QRgIFYd5jmLo1Y2dkmPs40BwhHzqX80IclppMGcskwuwG27
	A9QoAnADuCoSg9SHUw8qeQgfG+ME7VfJUretkKGMWX7ulHLa0lwjPPYnbKyZyuLL40aU9du3Uix
	V7Bod+7saQ3AU488NSdilBFGbHSS11jlqOFELhAsu2GyMnsTXzQYLkmAw967Thvwer7AtF3abbc
	dIbL1fppLmoOH6Aa5wLW5v3bkDdR0miDDin1beTR4EBg==
X-Gm-Gg: AYBFou1fZpfhJaqGz908rUt6nuJAkGW3QxTX7uI1KmlLC00ayGI3bHsn6O4vQzDWX9F
	AJMahcYcTV2max8FJjJA7JznCxTvrFXHELkqqFX83iWOjLd6iTuzrC4h6e0wsFsLbdYPLQ+J+bL
	k6SfVc0s15v9HO2KxDWYAFEtPTugaRwi5TTtZKL+2Es714atIk5ZnVaNwyDZMj+bhJyArwd7Jb2
	FoUqJ85I6Gbl35HjDEv6419rOnjF7IPNCiJFAyK
X-Received: by 2002:a05:690e:4506:20b0:677:ac49:ebc4 with SMTP id 956f58d0204a3-67ba4fd503fmr6927848d50.67.1793729478121;
        Tue, 03 Nov 2026 10:11:18 -0800 (PST)
X-Received: by 2002:a05:690e:4506:20b0:677:ac49:ebc4 with SMTP id
 956f58d0204a3-67ba4fd503fmr6927824d50.67.1793729477588; Tue, 03 Nov 2026
 10:11:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831105824.3141687-1-shukai.ni@kuleuven.be> <20260831105824.3141687-2-shukai.ni@kuleuven.be>
In-Reply-To: <20260831105824.3141687-2-shukai.ni@kuleuven.be>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 19:11:06 +0100
X-Gm-Features: AclHuK-dq-0izxpI304_Aq_uCDrGKVYvoCCr3Fr1HKUn_3aoN5LPt7oBOlvyrrk
Message-ID: <CAGgiveUQ9_uZLL=KgGtV0PNiBRbHhRVMqKxWwE3jww2asW98VA@mail.gmail.com>
Subject: Re: [PATCH 1/1] tee: fix page count in register_shm_helper() error path
To: Shukai Ni <shukai.ni@kuleuven.be>, Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jenswi@kernel.org>,
        Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nzvf5b0o0PkyebmUtkVAY-sxD3VBGUbU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MiBTYWx0ZWRfXy90birnbIKgN
 B+qZmnkf+KPrUFcZ5z8P59xXxl08UFPMrnn3TxBTPkWYOkvLKysj+8S0GYqKXWa0AkrsrfDrwEJ
 7Aj74066zIoXT6QfLvi0h0HyuK09xMbC81UsVeKe7QeWrJQU+Vg3FytfV0/mbaycMpqSDUmKzUP
 7biypFMiGhvOqrMb3o64nqaO9arQnsU1AHs+EkDbKmYJWRWxgidMMIAz0seReFOBWvSLAw5xtE+
 b3sposNUzEyEngNleg/TTaTyJAC4XSbIpjOGaTuvFkR7x9sv6P015u/G/t80VyoVMjXp1ypdvYa
 AePODeKVaINC3YkYphSgW/lNDtHncAlhyKMBy/vblEO/4o2cVAOlqyrrPbHPxDlm6YNHSxgd435
 shpyyulgK+xbtp28Mhp+rdyDWqVtPJnLrE5cC0GS3KnarOzxgWoGzkEh7hwz90FeClWz+eMdGX8
 ztLuwhXh6WVkMlRCwAA==
X-Proofpoint-GUID: nzvf5b0o0PkyebmUtkVAY-sxD3VBGUbU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MiBTYWx0ZWRfXy22Bdrx6WX0r
 CZdtbLMmMBXNz8s5ofq5sqIgI+xFHcc+VMeevcfv67c/XPY+m0qz/m4szj4MFBTQzFBl+9oru42
 Bx0PF2qD0pL2Jl6PyDZAdoUSJkItoho=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6aea23c7 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=bm2aaB7hBGvuia8LsG8A:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030072

Hi,

On Mon, Aug 31, 2026 at 12:58=E2=80=AFPM Shukai Ni <shukai.ni@kuleuven.be> =
wrote:
>
> iov_iter_extract_pages() returns the number of bytes extracted and sets o=
ff
> to the offset into the first page. For the iterator, the number of pages
> pinned is therefore DIV_ROUND_UP(len + off, PAGE_SIZE).
>
> The partial-extraction error path instead records len / PAGE_SIZE. For an
> unaligned buffer this can undercount by one, causing unpin_user_pages() t=
o
> leave a page pinned.
>
> Fixes: d5cf5b37064b ("tee: fix register_shm_helper()")
> Cc: stable@vger.kernel.org
> Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> Signed-off-by: Shukai Ni <shukai.ni@kuleuven.be>
> ---
>  drivers/tee/tee_shm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 6742b35..fa446e4 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -454,7 +454,7 @@ register_shm_helper(struct tee_context *ctx, struct i=
ov_iter *iter, u32 flags,
>                  * If we only got a few pages, update to release the
>                  * correct amount below.
>                  */
> -               shm->num_pages =3D len / PAGE_SIZE;
> +               shm->num_pages =3D DIV_ROUND_UP(len + off, PAGE_SIZE);
>                 ret =3D ERR_PTR(-ENOMEM);
>                 goto err_put_shm_pages;
>         }
> --
> 2.55.0
>

Looks good. Sumit, do you agree?

Cheers,
Jens
