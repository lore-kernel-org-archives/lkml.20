Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792841735;
	b=EK09oQ9qoVXpwS/5aXcgVedrnIG185wafjWP0kpc0Gk7xEZ70g6Oi6wzAAa8IrPuX7OB
	 g13jYMKEIfrkO4G9u6HAusy51ClVfosY184zDstmCU7EMuJN812qIA7/Tk4sUBlTO7nfh
	 v3SH3ZcP/TBCmBcC7GSdFASxUv/LdjkHfZ5Q3WQ0qIKwYuHd7qst6boIx623w8MTsNDYx
	 Kn48pZO+sq5gbeSZ/tM+v16QsSpraGxHOpzrJBjppOvtDdfxwbzGkzrYmu26E2ut1rEvj
	 V9g1FP4p0vIXhTIVlD4+dZh4Cza0xdIws/3FzjRSwIoatCoAHCbEoZrxdaKPW6ab0VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Sv2Ckx2zgnf0FNK273cchWmqdaiROeR0BuSXmJ+PR0=;
	b=y0dc4zr8JsoS/JHK9XnFlK/LGof6k3fEvzW7Q/hSzVMjpSSnlMehbLh7E1CPFQuVvpkj
	 kKAso3pJOLhs9P/oQNxdGbRwIVwByRT9ZqfiZR1CbfuoohLoSWREI08+pw/d2zZTYAx9j
	 9JUole9mdBuDP/W8bbjHyftQ3maXLUATUPIRjlQOUFYcLRt5kT32f/izDSNsbdNDvdnXQ
	 NlBz4UY5TfeBj5xJaXNmfausL3mJGMeDRJNVwqCr0nzbunR7osR4tGl537WH2LqxVs3WB
	 ObVD8iyJK7I1NQZNNbBnLPuAotGf6QUIzmyA8zBMS92L2/a4/6rhMNsUmF6jX83Xc9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UDpQHhjO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3C8606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B3C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UDpQHhjO
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-14e61bbf1e0so17766c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792841734; cv=none;
        d=google.com; s=arc-20260327;
        b=TmAzWyHV7hMv8LHT1V9O5GPz2jjqx6oM5PLhTbFYRliWUTZZSjC8xs1EZmV/nhhB/+
         mwA0IdzV7Tt4SgkyTv3dn+F1hGINjTUePPxfnFGFzXDo/UHTaDafqz9PxfSo9+C22ZhN
         NttZREGOCvErG/JxVyeCaB2M+m9D6DDiu6mDWa20GqK115ovswoKBc0jTlLAbNL/pCLR
         BHzA4Y7nlamBh0bDGniJY/9h6sna54kykLpdJ9Yv8ZXnXDF/FYbmsM3y5R3sw9Cseqg9
         GwGjn4ca1WFb9JLt8MzmtoWIAqTCsLap03t2bMzz5K27ZNRUxdm0Qx4eyWXUQ+9EjMlO
         5Qew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Sv2Ckx2zgnf0FNK273cchWmqdaiROeR0BuSXmJ+PR0=;
        fh=OrRSgAP1pnuWWDgUwfOkAfGGJ4u+/j0e8W0lW1Yw6Ow=;
        b=s8yIX08ciFVQAQ9JFiDJQDj7PMH5Q22chntVDkXFvlCzV/9W8Tw4ORYfasmzBWj/QW
         PbDuf15SOQXQAYjDB4UmJmaNgrgwLMS3GRaYGget/Wdc9abSuif+l22iya/phu93Qwfz
         x82Vz2kFtL9HJW5nqj8TpF/gtqQn8QAOkStbu/sD9uLQ87PDgAhAqPO2L/8k+4zuRi8o
         MpVQh8T657bdBGmrRWlirYyVMfSfdv0Ur5dTieUdKKGeVaCCqShDB0hmwPf3foQbckfO
         Ipf40/jUQhi6Tg/jbhSnE8Ev38BThctMdTO17Z8yx5v693INwXHrla+mvMJBwWKiaeAc
         QizA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792841734; x=1793446534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Sv2Ckx2zgnf0FNK273cchWmqdaiROeR0BuSXmJ+PR0=;
        b=UDpQHhjOOpLeAQ+UqfGehYdrCjlB46HMjQ/EW8qK/18tiEejR8MvCMHJZhZB+Dbz/R
         dlwWzTaBw3JbXtV9nAmMH4d5UVrTFgJjvvWCWj7LbKp1N3xectQvJaecfiHJLA21W20l
         7w/xMA/SQT8Gal2+9D+D+DseL0QDgJV7lt7CumiG/qpIqXC+iBRyhwCNtB6BUNvK1sr1
         LwwNEEA6NFQCQ3XVX3bwmopi/vLJ5SGeDu29X3N1Voy4LUcY5wdbaHfgJLuT/xnLpz5U
         ShjTjQbba90lUXadzxqleOieNVGfH3S0VWRDy20FCfKTz+Q2OA2QKNQEDOiXChyGYpRM
         uOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792841734; x=1793446534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Sv2Ckx2zgnf0FNK273cchWmqdaiROeR0BuSXmJ+PR0=;
        b=0/0zGtWbQ2S7ltYb4Jo6JpDMpZ9DDVfrq1I5m/y2h+vGt3e/zx2LhCOuCMppzXQQxn
         yjaU2rZvdLqqWsCmARcprKSHuXrYsJsPBTAKBFXf7LccHDFGE8eKrYRRC3hxFIz1kWCv
         P32M2vWRvzlozlT0AFAaWtkz5TPq2KJKhxDAN3U3QNBWYBR3srMJHpqKtz3Mdirx4mEX
         BdhwycHhqIX0nVUIiwExCaBlxIVWL6Fuqs76o2RBGvP8ppqNxlMwXF6uEQJDijH8GGee
         7dtY+ImOu3ZOTt6n5Lt+zDsLe0pt1Y98eTrrWFBy4KUs0JBnsnPzutz+b6lrwe0AX6Qy
         70Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxwCjzCFJODdANMn1OPOsbLlkfo9sVZGtgaofAnwAJC2c0D2/75t1KTq6GV5EN4Wf+WrVyFp28HiKVTcvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWp55lQyAW6Tj4FpvgxEzNoQhnVfjQnbLA1VUi+kl803KQXMbx
	Ld6+sfv7mM99uLzxlx/h2UviMTcQvXR/qajuc+miZPL6KtiJ/k8bEGdvw3mMdy7N2mAGtSORv06
	lHp4+4IDK30qOFcfNWR2y96/hJjagIMc=
X-Gm-Gg: AYBFou3vmY2n4WcU8JcBsa/g4xecfq+w3yXf8+y+IGwGogv66wXFKuF8K+SQbqSqeST
	YjHokrAeyTwTc9oOjSaPbKLxIf8PjePKGBPXECgpZZRzrfmdMXs5PIluHSUNl8H0wp7wMYHyrZH
	vBuSqxc52OjU6jv9Zx8wPlH+RcpPpSfYbx6k0bjjXoWBqIvF94ugptYUG5JSJuGMXklQwrgAMAc
	s7LLTPeFd/8GLicBxrsN3yfZm/+LWa/XVc5LlDL41NScpZeNd8fSy/pEB39J2l16T/x2OUhHGhw
	kQbo1WsivsVNOV9CKSbRMpn74dLgcdfp+Lmyo1dpVGMqr2U2uZEw0Yj9qgu4tCXwut9LkeJe5Mq
	GXTm95oyT4N8OicKkzjJO6l1NAvJIYkGY87E=
X-Received: by 2002:a05:7023:906:b0:192:a481:361 with SMTP id
 a92af1059eb24-1994d8b9822mr2570217c88.7.1792841734448; Sat, 24 Oct 2026
 04:35:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024091256.17918-1-testwrzwrz@gmail.com> <179283334099.3327.11706883238489839470@kernel.org>
In-Reply-To: <179283334099.3327.11706883238489839470@kernel.org>
From: =?UTF-8?B?546L6I2j5bOl?= <testwrzwrz@gmail.com>
Date: Sat, 24 Oct 2026 19:35:22 +0800
X-Gm-Features: AclHuK9pxstbMYf0EyqcMH-TBmz-g6K5xQuClbbepH1SlLVllcKyJtSHElNXP04
Message-ID: <CAKg18mkvJVPgYTr8ie2K6_q+rBAHfvCnxgbb9i+3Wh_v-cBXow@mail.gmail.com>
Subject: Re: [PATCH net] xsk: defer software checksum until the skb is complete
To: netdev-bot+sinfo@kernel.org
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I found this while studying the AF_XDP kernel implementation and running my
own multi-buffer TX tests. When I enabled XDP_UMEM_TX_SW_CSUM and sent a UD=
P
packet as two descriptors, the checksum on the wire did not match the
expected value; the same packet as a single descriptor was correct. I then
traced it to xsk_skb_metadata() calling skb_checksum_help() before the
remaining fragments were added.

This was not a production or syzbot report. I reproduced it with a standalo=
ne
AF_XDP TAP test and extended the kernel selftest: the unpatched kernel give=
s
actual 8817 vs expected 52507, while the patched kernel gives the same
correct checksum for both single- and multi-buffer TX.

Thanks,
Rongzheng


<netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8824=E6=97=A5=
=E5=91=A8=E5=85=AD 17:15=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
