Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592072;
	b=RrzUrg+BjY3Awq2aJVGY4dQ8Os1EPj3Py0wTnbwIveRKomBCjlIpeWfcNs0Gsi8AjXxW
	 7zczNWUncv3G/kcOH0XGSrPYNQVx5YqP4COdqvKy5/D2MEUOnVBygGqEfaQNUY7GnVJYk
	 wiyouO8QxPL0NMcHVVgdt6LM57bOPazvMoTSPhwDr9BP4UP9wVwXk0mc4V/O/jSqYhceG
	 QMrmnGMIC46l7roULasO8wxZQQ4h/x0VOVGJjL/HHg8z0eYJTOjXMDW/oolIWnjbr1V/U
	 aYE4W4nVSWDZ0EgomZuFg9J8XLBnSNfn7v805SO0+OzjMSWWO45AN49cSaQdMyt9Yyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
	b=HRldErVXGw81+Ly9VVu3tNeeJycltDbVqIVWycSNghizDWMqBF1e7q0Zz0ZLCP06a/xs
	 U2wJFHA7C59W/DTIulmv3fVx2RW6WCSRo91Jb7D9cKN8cjRlzv1padYXdy/JQnnomV/3T
	 HL3XrrBLeEVxwfggBVf4wE6F4c7gmQChclk2Va5o/1GNP5mIFMqHFoPMhWnOxuuwuA76w
	 95HVQYRCJwRp+qwxZPyXWL2dj2gFUaaCgp3rNctQk88MBP4GrszF7X/2P0a5INfwsFaoQ
	 W5n7rDn4UuoHIFNdVfBvwI0B/2oqUREL8NfOQOcBxjJYT5ZrjtC9PjaYPPyeZvSaGHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5Y2iAae;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L7ru3v3t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C17606C0BB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C17606C0BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5Y2iAae;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L7ru3v3t
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRVsO533353
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=; b=O5Y2iAae3vxsFE5d
	bb/rkn64PBwYsEBMSAwKJaK6QUBOzvaT/JN7Sw+WKNElb9GGov+5+qBGIPt9dyjI
	UOCX/5yCyKcW57d4cg6vRl3v16ZA/YI1s+lltrHyx/sP7shs3NV680IKYwiZwKC8
	wKhWXV6W2DUQI4X61efRhfgyLDseWAywprIqlnavRxUKN8d86RxDtCnyzHgDpEYi
	J/0TzccypLE2Bd4fWDQ0AVjoaNovbbww1x1Gltu2UrkdksM/l+KLy9noKBA4e5Uv
	XfGLWfvUT9lt2CtF51P+LQ7LTBgxktLEPpwWiOSETJNQfotta1ir+bN4jfUT8Nzt
	FzxYSA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaagtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:47:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so1534345b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592071; cv=none;
        d=google.com; s=arc-20260327;
        b=YuxMqJhfUUnOsMM6ccl4ciW4qk9XYdd+KEOpKM3GZ0IG3BbNqW7EGbA7e45sLI1voY
         E/6Euuz5jX+ZYO9XVrp2zPTfUBQeiBwkNmYxBRmCY5dLHTm9WKH9bqY+5A2TqSEReb7h
         UfBTW3oJ01Y3JVMv4+/QnremthlENK2h4yJseqmY+7U+X5VOq4TA25jXN10/yqAA3PEA
         en67Wiuk3I5QFGbW9FE/RVhJ09c4hnhTTM4pFG5I5MSMRWRr2xEmCjVdD74QMAXDe8MT
         3m14cOlm9aNeLd8A/tpk5gOhrHW1D1VOpbCkYWH2Hde8SCtmPm4pFoNMEgOY1aU74Na4
         +grQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        fh=M5JGn1SWfJF77lOSbR3h9hQxIQTXHBGWuzDqpF/VP/I=;
        b=EkwmhjL04f46D3fGm1+GvgGz/WEOtEtyZGzbm54uqcZt79KgaoDzqRR0CpBQmA8eaZ
         yiTkya9yGUWOCqN7vIBEqwh16/FI8ZXfcrbPl9nPjaHFtlsHyz4mD8hziv5h1CNu2q53
         1NLl/QjARgnRdF6fM9daHQUuqvOOZAfXyuaslQAIg8yeYefYgeQs7hHSfjQOkLxzXxif
         99NECm9tZbw0vsrvv5VUSKyAebzYPrQWOBj4J8JFxVOG465Rkb8ROzSycjJKLPajzKx1
         yGR+6nXMjTjoO5qTW94U76lP1NUEmLXTgHHOvtMWqWV6Mv2ZEpbrIu5gK05s0vgAZzbX
         gJ0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592071; x=1795196871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        b=L7ru3v3tiuBEzaUGmoQBcNGNJfoELvuh0XTOzwqZ8cyla4M59Ka5raZ866fQzX8SOs
         hmBz6LPqYqAobGj14hHWNp9ZtVzihPgDCmAjcnFbixpUR0Tg7Ef3SHv1j6uQ5j2sZoAJ
         IpYGR8T5dKRvZUM6RWGLrL0FDfsGMndGaoOPG0NsqeQCEHZe7d5vXFzCZeOiw1VV67ZS
         ixo+eeTozPPD95krBDHI6K5rtzz/SgHbTZOUXQtHdjxLOaL4LiaH67PSmt1y2t3j1qfj
         U+qMXKwD56p/1QMSD++65Y3d6klbZ2xKzX0x+Ke0OpW5OAIilMu4IdbcK7iqg+IBAsLk
         /hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592071; x=1795196871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03h8Stqm2jiHP1ePJ8/GT4xjXmJ9AokgbaM3KsJdgkY=;
        b=pa+wn4GhnWIRp/cxCY8nGXtYLVGowM5IlYqjoMibRfOA+b/FspLGQLR4/IuEhpZ4ih
         i//MCgG7XF43t6WEATX/N6uBs404xTpd9dPeHBQXkHt9w16ddBB9etDd7S3xKwzKgEDH
         3BCLAlopg/zkLEERubk6HRCKgEy2jxur5netO+CsvV8521tOZCboO2aUGzeEhgjLfnyv
         WWAVFydWdcRohqHqK5URW+B++dCQzFedOen0wNTPP0467HsswkDm1sj1uLMeCOEgfJvJ
         7NIeCAFXK836kHNKdSB6UbBljLKfIQ7Dj2hYmgo3WIvaJbJp+1czTgtT9Izkj9v3Sgj9
         8xMA==
X-Forwarded-Encrypted: i=1; AL+hErFbhKBFvuE00jGQeh/jfWmsFB3QAwEP0N0ZL6ATejHiLRanFcKx8Yu4l2M4GwH8OvW8rVjt8hZK4qDWrJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v465m4q2Hn7LPDKA8thvHn8TdkNIPru/6ELhxy68Eu3f3JHZU
	3HI8oAFNPxFZVd5Rx1q0PxugGix3a0x2C2612LCbmDSgSuIhKvm2IlkQcLj4U8s4ls6ty0t9ya9
	VR/5+jwqrqDv60h07FivBSq9crmvf8V56bND7hKa/8s4GACzG147EonI4baFEVSkUx0q1/84IK2
	YNbz6ZmdnI+0JvINf+EPjKxewXJ+k6i4TCU7XNWoh+Bg==
X-Gm-Gg: AYBFou0yDb3/UMgVtyzx4GLx346zutw9+I+XD2wLE3BVcP0g925bxpLQpyAWZi7UcgD
	BDcYw2lSzZ+kvtT6gE+0zNdkpXBWQBTplsyi+euKrnTnWovbJOGqxq3ZtJYZFFZaHBBHr5kK03E
	nYnLjC804U3NGn32CoAdwwmS1o3KE1m4vJuaVJVVG7EastXg2KCDjNe7MS+Q==
X-Received: by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc with SMTP id adf61e73a8af0-3f7a81b6293mr3316953637.54.1794592070864;
        Fri, 13 Nov 2026 09:47:50 -0800 (PST)
X-Received: by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc with SMTP id
 adf61e73a8af0-3f7a81b6293mr3316931637.54.1794592070412; Fri, 13 Nov 2026
 09:47:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:39 +0100
X-Gm-Features: AclHuK8NzVs_OvZcfoqmQEpBpt7jEXwt_UF2F5ZEs-xe9awuz15iknhP_y45KKk
Message-ID: <CAPx+jO9wAPreJr5Gt5CVFqb=E-hMjQnwRWwdnvpus0MObio4nQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: mediatek: mt8365: fix defines and add
 missing one
To: Julien Stephan <jstephan@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nw3HF4-Ng8O2FD-ASbOxQdXJSTEHNT3M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX6hslR1siqkDS
 RLkhN2yvaHLXOph9NRW2kS6iArBOgz2RtCKb3pozO90ef4YGQb8t0d77zHBzQ+gmxS5XdPkMbY3
 SQSk/QNjMjOMNZGaQoSy2oQpk572Ors=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXw5TlTRVCpTYu
 wUj0NYVqbLxnptwiKWIMqN3vzzhUWpKqJyKXUvrRrYtOBqMetYyCTOUJFnVBvfwZCxX5OqiBet8
 O4GNfN0NgfJ6To9GEVn4617hSeWtTvvZz8OPT2T3jmnZTBjLKfzU6t5FMTdIxF6kXvH9J56ejAi
 QX+3qN9qUwflvxNtCKOOmYb/dMhJeXTcMu+Gi0BynUs48wMGdKfFu2ru4QWbJ0G5lP4l41yNTS9
 TgRBHXuDIxSmGOM2QOpOPdQTDWK7bVApMuuLN1ENtlavc7+AwvVeqQU/MBTQmlYSZqIT8wFg0md
 w6TKAPVUpUQn31aQMJpFu1qR6SYpblOgRR54+AgkZpw7/EwP6XE1mjXziefVN3U39AAeJIX1yMp
 Mf1cRqP8bXUgmBt6Dj1hWCIzBK0RZPNnnb3g+8rBtFXEtcvAElBAZdM7zP3uSLN7HrJwsMtE/9D
 yGg/X4FggBqeLihyAdQ==
X-Proofpoint-ORIG-GUID: nw3HF4-Ng8O2FD-ASbOxQdXJSTEHNT3M
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af74d47 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=IpJZQVW2AAAA:8 a=uk3U7i1IYnWYCnW-BX4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130070

On Mon, Oct 19, 2026 at 2:33=E2=80=AFPM Julien Stephan <jstephan@baylibre.c=
om> wrote:
>
> While trying to add a missing define for BIT(25) in
> MT8365_POWER_DOMAIN_MFG, I realized that the name was already wrongly
> assigned to BIT(22). Trying to fix it, I also checked all other defines
> for MT8365 and noticed a few other mismatches between the defines and the
> datasheet.
> This series fixes the MT8365 defines and adds the missing one. While at
> it, also fix some indentation issues.
>
> Cheers
> Julien
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> Julien Stephan (2):
>       pmdomain: mediatek: mt8365: fix defines
>       pmdomain: mediatek: mt8365: add missing define
>
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h | 11 ++++++-----
>  include/linux/soc/mediatek/infracfg.h         | 21 +++++++++++----------
>  2 files changed, 17 insertions(+), 15 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95
>
> Best regards,
> --
> Julien Stephan <jstephan@baylibre.com>
>

Applied for next, thanks!

Kind regards
Uffe
