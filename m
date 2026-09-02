Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DEF469857
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345874; cv=none; b=FGITtv4gB1wq64Nm4X1QIA+1oTuduH3QjXl56cpC5AbahGJU3xs6a2KwMcLcJgo22wT+mOlHWnOgHc01bS+3rD4MHe1yr7mNZ1dhwA3karUbsHF2CeFFOhEQTRmRyjitluCqr9ijH+hYBpgYPteCeJ+BS1XDaD281EaKdabEWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345874; c=relaxed/simple;
	bh=L/8fMTR/45p2Bgt7Oq0/m23ikeBGM1Y6DORM+lyIJDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0tPWdI7F7e/tkHXPKlTKokPaDhNgqw3a5omCsge1i/vdRJqIixxlYzRSjytpPTgmMZkeme1tp/4/lQ8KUDYvBmPFgysW5quPdGNosvsG5Ffgum+P8NnjqtdYqNQUoPagn7H3TAgeL3eph71ezlHlFqPeNIyhH8xWv6LcozhprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4XL9uVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuL0c3nT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4XL9uVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PuL0c3nT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682A5hlJ688596
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nucwFt37zXBwQFN0WyrwqjTBOM2Ta92KWejqAkDMZ8g=; b=g4XL9uVbjwJUVEBU
	PMdxXwVAG1aSs6e5KLaLQpB5NTR19CN3OYA0xfOFAv6AVLUtn+3DR0xg48DPziXu
	tbUhprMWXkvqHDVBpx4rvL8hnYe64Ivw4IrW9mRzYFN4mzItchooodKXjCn+1rdj
	xGqhw1Ok9V6S5ts3cdgnpKxyqqZsJQ9kwrsDNDojfH9so2cMPzmFOx7SznTbdMuF
	lShjkWdAX94F/HGmmy1ps6BSIm+VMFELI9dkCAXK6yZdwTXU9lIcDBrAaQq+PLnZ
	eDpc/rnVhkbTZD3MRSbyxIH9sHKwOxZN6TbZatFJLxXlaALBUvdABbSbYTBraQY0
	+/IbIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gehrd84ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:44:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so194170885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345867; x=1788950667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nucwFt37zXBwQFN0WyrwqjTBOM2Ta92KWejqAkDMZ8g=;
        b=PuL0c3nT0N1GrTDr/9FHfjgmzr9CN/D6yi3TVGq2Q4L9I+Ry/oqYErzDUA2RJdwpjd
         O7k1leFF6GYxeMsdR8Rx9IYuLdcSRjdXOs7AmOXPbuaQHVQHtpPRCMqJihDIdwxGVHHR
         D7nOzZzKdC3THa7jwFOjzLN3M8aXmXgKC/wQ4d54P/Ev0lwuB9kjZLWDlVUyIE9Bu5um
         SbAgclnLJ4U/23LZViGW8cKNyk/sFy98iGA8XC5rnIhv794Qi7GD3DR2gHl9dzSfgtPp
         qHWKkOsDEd/wg1LzP4mn5+n+TWN1sg6DmzN3Z24nKXc8oqbrvYmDdTkAV62K8WdrgvR+
         /Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345867; x=1788950667;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nucwFt37zXBwQFN0WyrwqjTBOM2Ta92KWejqAkDMZ8g=;
        b=kG/eeUPf9W5KNFgOidZ7nFk1e60eMlyVAzHG80AYCW/ntkxhcRihi+nZf1LfS29WkU
         6yS7rRaInP43TveAcrvjvGbCInZC8labftqp4kZ+NfxffuCSLoAxM37RywuRSdSIBRvr
         I5Yw105+9VbqKBAz1MiK7hJsLwhNpElPYKGjV/hvjHgyfiqqQ5XOfl2X2fkOa3O3FcyH
         NgGSTSZqaVeHr5ab0DX4x93OERXywYK1rznpVWDkEypcOeBdt1s4tg7GZJhc0gqc40ee
         YlUxz0HqU7dV3adSdfvUL7hC+NRlVsFWxNUd4uBP9wB8owGjaDEkCEpX85I6DRWOWMeY
         Uzmg==
X-Forwarded-Encrypted: i=1; AHgh+RpjUdT1VtuMdnpmf32U3DeybnbGc2eZDtjxit/aiRq+mLevTxC8xPyAWGm2pk4I7NyxyrvBa8sqoVLo9vI=@vger.kernel.org
X-Gm-Message-State: AFuF++mDsNbJExclBNOXUr6q9CDPkUG6o7MI6puItKjc8fpvEg0MFd/I
	X/bTpJ7Irfz8Zb6WCMcqtke9JvnetR5n3x9ejEmUrLIXU03pqV66W9Z34dMqtHT+bLb55yMndbI
	Js5RXzymcA+Hsohp8lpiOmdyDDPBa3kFldkNJeDdZ1T1p/UYuh58e+2OResaaW59oLd0=
X-Gm-Gg: AR+sD11CMCvNSrxTqEFkCZ9fePiDnWSAvBnHNFQndKdGDeOYGt8cuCWXUgw5MASFh6B
	AR1J2+sy2PURFq62bDjHuX70qJJm/pMDB4OlvMAs03nl30Pq6ulMpEm4Z/djJ540TjRLLF0Evlt
	5YzcxWqrx0uMZuKgnC2CkR0LadZVNgow5B/8jKN61IBgfVRRJklZ1XvMsXXqoXMetWyjS5G+Niy
	2GHEzRQjps/5FMhlSOG10hSXCG3eaOFHWlRrTkVSkJiR5bLgW1IWnHwNvXF6awdXxy+fpqVF4Y5
	4U5MY4ACYG5whef6/dAk5FZ3ypTlsVK5udn+CVSDYMMxWrwVtLZLv2Tb+GSlYLjjmYls5A7YgeE
	EoiPnAX9Nv8l2YVb16Z82cTYvYYY=
X-Received: by 2002:a05:620a:25ce:b0:936:a5c3:512f with SMTP id af79cd13be357-93960fa200bmr388502185a.34.1788345866838;
        Wed, 02 Sep 2026 03:44:26 -0700 (PDT)
X-Received: by 2002:a05:620a:25ce:b0:936:a5c3:512f with SMTP id af79cd13be357-93960fa200bmr388495885a.34.1788345866263;
        Wed, 02 Sep 2026 03:44:26 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7d04c69sm26431115e9.8.2026.09.02.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:44:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 0/4] Add RZ/G3L PWRRDY power sequencing support
Date: Wed,  2 Sep 2026 12:44:23 +0200
Message-ID: <178834586046.14988.12802695879784899486.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q7s5RbIhXAvir64aCT6dBV1Ig9qdSEl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfXzi4WcbA2Bjij
 EYTdLt8XsDgiH7i6KhvODatSbqnCw8nI/fAGlNWfEw2xkgodGN/ih3Xv4B9pN1GtA16NYtIIxZV
 40D5gCodfbQqmzoQevnhXh7o6QQfZnjkCxNNA6Eugmxiuri5oTP0jjOpJr7X4jh0dbxYlK/latc
 +j7jVHrKqNvvc2ntg/ZsqLW2D4dwnxEA70TX6eh4M/HWVp4wF8LhD5IgEIpzJ93nt8CXc3OY6SS
 qvI7eYBaX1jDb3QryqHf/lyUN80HB7lrxUHcZHOnG/LavzQjNmbJsLJDDwDVeKtXdvZLzppRJWL
 o9RCQFkZkCszcXn8/MgwxK1B6TjB2B4gzEJOtkOSzspBr/rK5jR8XUxWO3rZY4qADJLDlK7OI+K
 qw3eDPWRYTBJrjj3osECi5GF+roltza9/nf8a7P4gfeNXrJLSKt4zD2RcNRLxIwIHNtIrqPXDCL
 x+L2ifJzqVFXL1A356g==
X-Authority-Analysis: v=2.4 cv=NLflPU6g c=1 sm=1 tr=0 ts=6a97fe0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=yC-0_ovQAAAA:8 a=EUspDBNiAAAA:8 a=_GP6QsbVdMz18HCjZqUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfXxf338kJuGVnO
 RbnOMS0eLaODp2tYEPEs9NpOGuMLgv7tZBR4dspLUOFb681W+OxmUXYM0yjcb/g4nFEoDcBBX3T
 cK6w49P0DYIhMmFt5rjCFj/DsLHmQvc=
X-Proofpoint-ORIG-GUID: Q7s5RbIhXAvir64aCT6dBV1Ig9qdSEl7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020094


On Wed, 26 Aug 2026 13:27:22 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Hi All,
> 
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that signals power
> readiness for various IPs (USB, DSI, CSI, etc.) to their respective
> controllers. This register is part of the SYSC IP. Add a dedicated
> power sequencing driver to handle these signals.
> 
> [...]

Applied, thanks!

[2/4] power: sequencing: Fix build issue with COMPILE_TEST
      https://git.kernel.org/brgl/c/3b54dbd119805361695cb50ca6a875f4c7518b74

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
