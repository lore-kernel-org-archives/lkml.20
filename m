Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513436;
	b=qn7pStnVbw3dfgP+Tp1fki30q3G9Mqu92JhxYMnAeHRzpv0ix7apaxuy9TBZGezyZQRE
	 TkOvT36lJyPcQLP1S7CICkwaE8CyHL/1nFEmnezjkJr6YuxfNMyXJaHOX/aEtb1SuuRgL
	 zUkVrHLqm+xDbfFnEwHQOEcDomhPrm9XeNCNYR5+lYejfvGrvdyq4MYE5bA0kbavIL83Q
	 s/TxOTSck/CMiuRGjnkdl/Tgldl/dDuHOi0xAwL/HHo5WUAnx0+kdea+Iu5qgiX9vAp4t
	 fyVdcrKu4XLdvF9w9utCaDXsbjQfzqTMnoRhA9kdN8pb1lJuuzcGyH+Q/zrCw5NwoaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
	b=mIhvaf2uj7HAir4DSfEQBbUC5tN5bB+TFg8TLeGIHt82MGTCuhhJmSBKWyAH1BdKQAGE
	 hm42PUiCW3MDZjic5TJUSD21aCDaOHTlx4FLmY30qKR7A9kc1+2WCMyHopsQ/SEXghetj
	 jBWDT/b510FfVGeUcZN5UiTSY/Tu/0kxlODPYdR6sxbwtstCSYngIYoj/UEkVUgzuQo5x
	 WsDRFMzCu+e1qc+xEf4JpzaKyiBnOhUqPcIPS1MbJXRlG2WefnzJFbRMXWH7kDvSrsCqZ
	 OU1RuH/nhYUCdEKP4lbysHWW2S/2MkQ/bDLuz8MMT5Fnf4344ZTJ9l1/bg0Fx3E+8dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nNJAyjCA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6E606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D6E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nNJAyjCA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550dd02c9cso283452eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513435; cv=none;
        d=google.com; s=arc-20260327;
        b=NwGe/L03YQ9xhBx53o8ZmAi5E4rb1arUc7ZsxGPYcjdApdwU5LTzgqoRoN3ZA6egIv
         s9Hq6n+hPS5LIwUepOCrQhzxHcTozUl4dTGzlmKNfOsdFejsVTVrJ5jbIokhY6xcLvbf
         JrWcATFAdxhprpVaO8IkcVPsXE255zEPYlBMFvTPF8dA9KUosypmDBdQeO2u89PxJf/f
         TMZh0IDqclRMIkvBivvb2RB5L4COFE6mEf1EsW64R5TZTbohSD737HdcBhI1h3opoX5K
         p3/02DmSwQAo4MjYvtm00s6rmv38rv0OLcyQXCr3JzBHOj3PPHpqhqnlTNG5G5m28Ip3
         YhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        fh=vYgWIUhcdQmRLd0or3WL73ZhsYjbA96mca8m+9/ZduQ=;
        b=kedIK/8LYPoda6j1IiDN0sQtABjXdRxvzi0pvPrRFUsp3enhf9gj5FmivljlsB7U27
         3kq3vqtY4hi/LcK5ui1CFRJO5TFcXXhR9es9npzFDqE5yx/5p6Es75Bhm5QsfM5YFZay
         pGNvG4aNRyhelWpBhnPsZAk2fjFLYAcsjgqGrUIJg90u9BgFqiAXqyL2G+kRKpVboY6B
         E0qMIxvQajhlq80sMFeqpvaX/3q9MBtxfDg7oK3Y0FNx22Jm49Lbqgvvv9vwUWZwa1J+
         1hNfbY7drrVuYLvMW1y4SXPd8Yj9MxDN1YVWsAp7v6XNEYZaB3t6rDCZVKkKqIxi0Vvp
         /Itw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513435; x=1793118235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        b=nNJAyjCA1cBtwTNsbNVgKbr42Fi2rxrR0AfP1I3EeNVC2GFOPbZzecenbHeKcp0763
         qlUTrtVJHbBz+kOuCzFOkQsDsTFo4W3CIiQxL+dXKPxYMKuPL9MGv3c2JIPRu/SGDt9t
         wRGSzHBAxq2gIQaYhRjmaoOVm6IvWlSd2hLmnzUoEEI7PDenhNsNoHVAnGWxBXqp6Z4G
         4GUiA+/JjyrtHoXM38Ik1qjtKbQ3+epNp+KSjx1NeRqAu3AI4TtVaPgITFEMLjJW3Rrz
         xE2SQkOuL1B20fBoNghYNTqsAnWLHLpp52JYVQUAcXlWWX+22A2MP8MlLzcVKezcpgIO
         5yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513435; x=1793118235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        b=jgkHG9dTv4i670AS05PI+0lHPd8ctmyqw9sqXD8ZO15YGeI1QO0uLHTh6hnFDk4pgg
         ChtHJc566/3juZo4p/WOJyLIEq1bjWgQJUVt3KNd3treshkPOXuixUwxWZr9W3pR1liY
         s31wU78n5jndC8IYxNTjkBGVKmijheQOJrJRLDiEjW9cjRvjMyg4Wb1Vz8+8Ci/uztwG
         VsEtt7z/FXYxVzQeDeeOFJtogfEpU/MHl4sqELiuLpQr9MbF1NtdcEO8H1Tq7VAkWUOf
         pyZinCMHubht3XNFPP5viJwQD/gRtM3ajYawHU5zyymF8A+nh1O0LKy7SKkzCyU3gJWQ
         djhA==
X-Forwarded-Encrypted: i=1; AKwUvBxlNiocPrujpDvTuxbZ1PIaPeeB+4dUbiS175KmJzREejA1J0hMNcWKI/LLzMhjCVT1Mwu0c/Kdiecg9dE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK+umkWEDCNqHGNYE5G2qGRw+27CrMX8yqrR/jm+ja/ZCqifrt
	fwKuodNIyrL7nYybwaR1/KhNVKBOwh3Mbi3t6A13MsAfFeY7uZQ9XMBcKjYXI9z5b7unHWuaZke
	SifkoQMlvHRvTmKCDg1RJEG0+qPoaHi8=
X-Gm-Gg: AYBFou1KLShtH9IezuPfBnFPyL9JwEgC1QRL+ygQdFvHqXe/N6fm41cRqTPfEnvQpD3
	R7v67eupipwusB/DC3RU4AEO+TpjKbncWFat/JMo2w85qQCAgY8RWhBp90f6cTyrhRaNRrzqUEJ
	o2vWRY6RgZ31SpIXoPIwaxjt8fl+l5Frz6PDR7HL/ncTq1bCOUlOqVmM4YbHAqANrWBXQClP7Ik
	K54k8OMMxBrfu0dlH28Df1vHO8Z1RKvdFLuN1KanwwM31SreEYbQWn1aXXVOsWOKwJn5OZM4kwQ
	Vo2GaJRbieOOasUZY4NHB3jbBOAayrBegUvSAmDuKYZzMDOShV3whFCZldvnA8mfS1JhNb30zJk
	gwCK3ukmWUbnoQemjFDKDktcPgyB2jNWkBL+DWChzAU+FsojefVLklgTrvVW4linyvIHtZrv6we
	b+SoHQztRnLzHoq4KWHcQn1R4a8CwLPZbm9dGqowiZRZzrn+1BzmkgtFjudK3Fb50hGrU8jK578
	ZqZGoeImlGRwEExJ6UsUioqtf+tEIe4m8BG
X-Received: by 2002:a05:693c:409c:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-361a06a6544mr28167645eec.1.1792513434719; Tue, 20 Oct 2026
 09:23:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016160030.118973-1-ojeda@kernel.org>
 <20261020133156.3153106-1-sashal@kernel.org>
In-Reply-To: <20261020133156.3153106-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 18:23:41 +0200
X-Gm-Features: AclHuK9Pd22EdXpHIfqU5N44FLer_q0ZOIvVGA7MYMY15OzC7aZuyhpkAko0zds
Message-ID: <CANiq72n9q93=usmoPqey_ohnrZ_nQOwvZfPYLAXgb0h1-NSjEw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, error27@gmail.com, 
	geert@linux-m68k.org, gregkh@linuxfoundation.org, kees@kernel.org, 
	konstantin@linuxfoundation.org, ksummit@lists.linux.dev, 
	laurent.pinchart@ideasonboard.com, leon@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, mst@redhat.com, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, stable@vger.kernel.org, 
	tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Could you send it as a separate patch to Greg and stable@? It doesn't rea=
lly
> depend on this series.
>
> 3/7 only drops rules that LLMs follow more strictly than the stable trees
> actually apply them. Adding a new kind of fix to the list is a policy
> change, and it should get its own review rather than ride along here.

Sounds good, I saw you split it in v4.

(To clarify, it is already the policy in practice and it is documented
on our side too; but I agree it is a good idea to discuss it
separately).

Cheers,
Miguel
