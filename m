Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577505;
	b=Vq1HlUuI5MjxB26Z7XtnJDvfb67pxXPRY4eNovNjTorv/83NfXd/wU/ZiaN970WsRaS7
	 iYJpCEPzP7HDjLeY/4rQLg2PCpbIn9YmAbAmYwnlZ6EPai8uKddQN08Tba4a8KUzRmf1W
	 dzePlVKXkjPWwpK/N3L/dXkR269miX8izPl9Mc2P9GFD3FK6KdXSxiZLP0EkQV8liV4Uv
	 +3/I862MtMdrg1BHSJDmQcqI5LU/Y/oWwFM2Hyhp2wRF7ARoKupY+pV6lI5q/Hdw+6sEQ
	 p1BoCKXOu45jqoLxTiTB60FKHFSWvz529Tss41DoMIyFOsgIDLvNSAKieAIf0poItUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
	b=KatCuKX/yEzMsK8JeMGurTXtY6eZcAe/QicaRHPbpa0CNq3aQ+kpSmPtG2PEUqu7pnC5
	 jI1XNmlycTXJbZRjF1ZFTFQEaotZ8DTNSSA36Sr8pj6Md+Q1EKxUpcpGNRXBRqbUb8vQA
	 phCYOc0vTFrgMFK12Vi+WJrEmBb1X1FigMUlGGbTaI3R0olgR4VqYmApBRBuE1Odk+uC8
	 u8WXHJIs2iudlmSv1X8Iv16/sJA+sHro8GcoIxVq7VlXaB7ck10I6I+U/yrlODu8DVC8t
	 5XCAyjn6n7qbgwQqw6KTPlRWj6gjY/bO0zRJbInHARzdLw9v32RuJX9KDsa03IK7MBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JU0UXLZg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoOR4KpI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC2C606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC2C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JU0UXLZg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EoOR4KpI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6JDB4170637
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=; b=JU0UXLZgv/aesNL9
	DkhERiOeUdF/cM0awIlxTk0TQAcwRoizT4N457qvyLadUnIP1/z/UbdVjWlWO1KO
	oZduGNiUvcWIyhWd0SEXR/+kW8PDUc4gCmMeTGp1gNYu2A6VfbXx5+K3haslaoOX
	MYZb5Dcpx6LL9y2FL7+Du2E4WK+hrggO1Ll2XXAxGLSHtIeb4IvfHf253rO0BKYT
	MhJ2XDgKYiY0CZ9JvQuLITqLxtjnyoiRq25gCIubxUACcUq2jArwL5IRe1+7RbbV
	a8IepJPaBhxZESgQlRNUSLzebni4H7erhfughpxxGTSr7I3kanPhRBZi5lnWSbzd
	U6lNSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hud9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso17495985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577502; x=1793182302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
        b=EoOR4KpIG5n/glao4kPsYKR60VJw3V+U8H5SnXFz6UUngX3xXHBMbprzxRq0JkgHMY
         N5MQCOywZ0GF2ytgG2xFe8eqoAEjRjtacSyvOKeLXPEtu1pmE28fikYN/fkvWja/GYgR
         yupNIvC8m4LtZxrWc64LI5fjjk+1mSnKWOnvBA5p/93dtHFAUsOq3dxN/Y6TkPOrVUUJ
         SbXU/CpFqMvB/MJRb1yc/WQ8zVJln/uabwKUOcWsnPSD4Yrj3SjnLZTESCAPgN0ASKd+
         hNjwNNyFwtwSddBkwUmzJj9zmCtLmRToEG968MPEhOVIxL/UR1mqA5b68F0rvozvz4KZ
         f3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577502; x=1793182302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RA/TbCtoW0RTFGn5BbfFu3qtFsWLgOrhKfuYxlR+MA=;
        b=EkYGp3dGOi60nUky8lrwzUIIAvwAn3gGNWYEty7D/lT4WVojqvdQ3SkeI2wcaJCEA/
         jT2pYVAk2h3yKDYbOiXD/XTHVaWket5gXHw5vRL/EU4PHi+wUZD5XQAyw8caaA54PJqX
         VtOlflLBKqsLX5DN4xmHc3f7wv7zJpCxvCvBXjWcyZNT+w1HDC4w4L7pSKo5ujvYVra1
         CyBfsUHRouxQRLZ43AUz2GalYidXvXnmKESToL6r2Jf/Y8NKHTQE5dqONKYH1veqckGm
         V/krade6G5qiOz8FzpNYUbXJdxvNzRkXzxPOrF92Fv0gO6jDBTpOfACb8mLFVzwRO1AN
         yzfg==
X-Forwarded-Encrypted: i=1; AKwUvBy0Fc+9KNT/bz6dh84mHWwY2Q+FKcdxg81tsmou7bjVYTOcbDpYUZWG70wH2wPyZ5FhZwDEH2FsnPO1kPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL93R+Gqgl9riRYgULQM5dyzWoQwQiU/RYI4EH5USTYsRbz5AY/
	h4QYTp/B3dcfCVUqCOsgjvherqiNYtLckSMe920kgpBA1eC6CTfUS0DxKbp9vjN3R9AY+Dql4cW
	bGp/AhNscpbOCsByK3rpOc8pFWHO4kpC2CFGMWwmFEVudjQgR8kw15KdQnzHJELG3LPU=
X-Gm-Gg: AYBFou3IiZkCVSknX9HNNEpohErA0IwGWR5qWrzpqGoCrrVeaislTfFL1ddDilUaxyj
	rOoKTsdgvM+503KZ2y8hPeZMX29UrkEzIQH7Wizc9oI392933wltwhK/qBeiw2jqOtf5ulgUKZw
	UOxpJf07s3S1/DJ92YUGkblQTPan2RjhdlzjPtfn0VblcKFDoEmK2LjUuebR98KhC/RFWxf/BU1
	mgvEoyNEieqFvs3dFGNP663FfvlUqJIzmtBj9Q3Jq6Rkrnpjme3RU8PMYnOwEsppvW/lRdfm9Th
	Yy0Iry7yTPoRjMK5aOzlsjXQgRN9mw+eEOD7GpSjC1mxLAZfIO1iHpVrKY9vN2SqqRIrqCakp52
	oFzCRv1cAR73wxL+HyobZ9Q==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr371155585a.2.1792577501957;
        Wed, 21 Oct 2026 03:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr371152785a.2.1792577501520;
        Wed, 21 Oct 2026 03:11:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa02dsm61960466b.40.2026.10.21.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:11:40 -0700 (PDT)
Message-ID: <c4f82514-14d6-4516-bc09-c735f35978f5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:11:38 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad88fde cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX26zKoUxJeYtv
 b8/pp+kOYzDUUxdgVcZ//Avbp805sIR8WGbghRuiqoaZmSxP+/UdvQjfUrzD5dVmrqlH8bXRZss
 c4YEwL0bub0Gfn0wCtJ2WT7gTlh90H8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXzchhpA1nyq5q
 VY7GuJ+n4oKrA5/FyvADQ5lZdqKTkyXSvo74kxVh5FYv9rBmoutJreILsOrtmiC1m6SbNuJ10DJ
 6ruPVsQn4Bx2yfiGP74JIKhlo4fdyNt82PxBGRAiIEY+Ojf5gOd+w3QXP2kzaPVxYqqverSbmlz
 GhjuTBSCdqgxuSx6jOvYHfMLmTh7onjBxCIqc+ZoI3ygGA4t2BNmIirtgJ2g8IUu4KEwUxdzUTS
 H6GkjIpAOn5VL3f4O9g9uy3tX+pbVXLm8hCqD7ZS8TjmK0Ne5jb/N4+NyTxwGeD78PiEN33hZ1I
 VFxSgllW7wsZIrJQdjOyY5iIwUkidcW93QMTsDMtqaOcYg3AjHhw/5US/DEpQ3JAoQ9ViqD/6Kk
 guL3xrna1Toh+ergu+T9DKG4TuYECb9aTuo5/JdVXVwlreKNZlYTmTlTsNao9nL4Zos6fYJWXZO
 vN4GHxJIQZyvhmCaPBw==
X-Proofpoint-GUID: 0z7P0VI29aAZi0Zjv1KXes1BBFnjJDy3
X-Proofpoint-ORIG-GUID: 0z7P0VI29aAZi0Zjv1KXes1BBFnjJDy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In adsp_da_to_va(), the offset calculation results are stored in a
> signed 32-bit integer (offset). On 64-bit architectures, this can
> truncate the 64-bit address arithmetic result if the subtraction exceeds
> 2GB, causing erroneous bounds check failures or invalid pointer
> translations.
> 
> Fix this by using an unsigned size_t offset and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")

Konrad
