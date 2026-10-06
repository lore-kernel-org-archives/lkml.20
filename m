Received: from mx0a-00617f01.pphosted.com (mx0a-00617f01.pphosted.com [205.220.165.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36826351C3B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791346859; cv=none; b=Dvr+ygB0KNr/WGqtUZJTPdXAKzPXugodKC99FSHzrm7sterRYuyFy7EjuBU+ykIMj3nwkr+ndUA9DJ2pP4RV0z0xQydt1I0r9Ef+ZF1UO7Kcs5+9y+A/3cXGswz+eNs9XZ1Y1xZdW+1+oVW3IZaze4iuhyF5mahgoeql0RyR+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791346859; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BbqfUqQnZ9BvwolDVZCBiT1QCex7ZT3f5SxbkDkHGrysmFaOvqR/UhVxYEmRRZgx6wcxdkYz/DDbdSKwDaNodWkxMjAXOxGEoZllVststxPhWTipNMvi3DWbN0FP4K4Kaibo2zP2QMBxoM6kRZkhz1drEQrYLOWobvqL23D4QJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=psmicorp.com; spf=pass smtp.mailfrom=psmicorp.com; arc=none smtp.client-ip=205.220.165.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=psmicorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=psmicorp.com
Received: from pps.filterd (m0247527.ppops.net [127.0.0.1])
	by mx0a-00617f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697002oK3309987
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 20:07:59 -0400
Received: from egc-exch2.psmicorp.com (webmail.psmicorp.com [38.142.134.66] (may be forged))
	by mx0a-00617f01.pphosted.com (PPS) with ESMTPS id 4h5b5e00ne-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:07:58 -0400 (EDT)
Received: from EGC-EXCH2.psmicorp.com (10.1.1.111) by EGC-EXCH2.psmicorp.com
 (10.1.1.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 6 Oct
 2026 17:55:51 -0400
Received: from psmicorp.com (10.1.1.107) by EGC-EXCH2.psmicorp.com
 (10.1.1.111) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.2507.61 via Frontend
 Transport; Tue, 6 Oct 2026 17:55:50 -0400
Reply-To: <greg@gospelmusicuniversity.com>
From: Evans Thomas <_us@psmicorp.com>
To: <linux-kernel@vger.kernel.org>
Subject: fund transfer opportunity,Reply..
Date: Tue, 6 Oct 2026 23:55:47 +0200
Message-ID: <20261006235547.3C16C11681FB5BD1@psmicorp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: xCNt9DgUZm9BjPIdtKg7S2aVfuuNRDT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAwMCBTYWx0ZWRfXwYDd+oQ0/SGB
 Xeq5KsxCJKZP8V5DCncv4cf8MZvtvzCMExpHJ5AX68Eal78D5sNVIgqpRUJBC5Wyg6ljH4KsdZu
 TSkePrS1iVh0w3d/lTYl9HqfrlC2vIYgw8o7x6SkPjN4IbkyCykScLBkQWypPKmwfRRCzYbMKOA
 JBae7IErTyucaqTnvw8BVrCS98z8WuwnCjb+3Kq6PyvUoJTIXJgysYoO1fT73GAcVIJ1Lb7IS7D
 1uYZy2JyYaQ5Iyu1Jkj4kWwKKu8MP+ISXjBb3a96OBcSOsiuQKyVFI08/OvbCFne8QIQQNX5qjT
 AXo2TcJSnLFiY14F7gyC/Jx6iyjRsyh38XDXJkwLf5tkrI4pRzhS6+fV7Hiqp+V4rR8GnPSRfQ8
 qVlWet1vXqGe5zGJWROSAg30fs2isPZXANm601e86H/frBmzGFi4SSTVEMfYks/HWokrtldt3P0
 khcq7uhulWI3Ur0RwEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAwMCBTYWx0ZWRfX5bGSSneeam0u
 1Izqwe62g8czUtO+cMECp5d6uup3KTRgNnBZk0i/UU5f+FetWgpkXJ6bkO5ngScxonv26uDI4Pr
 p6zYcrJVfmAf20+gZloDRaZSdj90VPPx8Cu1ulpmpxojSZ+ygFmS
X-Authority-Analysis: v=2.4 cv=GvTXaU1C c=1 sm=1 tr=0 ts=6ac58d5e cx=c_pps
 a=sNj4pI0fii9qGHoVqNzRVg==:117 a=sNj4pI0fii9qGHoVqNzRVg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZHGAjPH774soz-f4Le74:22
 a=GfZueQGhKz3ujf-POmTq:22 a=tclcd6dtLQvEqt9_mmAA:9
X-Proofpoint-ORIG-GUID: xCNt9DgUZm9BjPIdtKg7S2aVfuuNRDT2
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070000

