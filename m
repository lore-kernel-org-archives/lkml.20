Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98BD30D407
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038025; cv=none; b=uE+B6esBiuekKSUVuQw3t9EiaDANsBts+gQguScoExAD+wz5djv6nwnyqMpsiOpUop8D9s0mK+RV1Es5hGURJFaBS+rDUUfAHxgH0Jh1h8Pt3aTMj3nbmw9JyNsYwNMcxO7D9HNVYSlGVjGGWOlD7GWcBfeBtRO9W11CSTYA+YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038025; c=relaxed/simple;
	bh=NNuJZ22mA6zExssbWs2MLuIZS0TFSBHvc7ThcVwtvn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6E832QcGZR4zH15RaxWrlRnAglPn/Es24tjDNF96Ly72PsgU2hUSQ5Pp3xzXo0K9N/GgGu3eYsAtkxTD0PeHCPNXlEt+BuzZrLj4otghCG2RbiIPQ3C6NUboqyDnjVS60BxokPLLQHJZMKRWMrtoB0PSXYlQMPPqW4DIGeDEzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA5/QHby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpuzPf3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA5/QHby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpuzPf3J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E620r4053825
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 14:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=; b=AA
	5/QHby7PdhLXGqSUGRfUdtuyf6DVwOKmUAvav3QvRSXiszqyuXSTdDMDS+5zpDJU
	QBADu/YRiUhi8MRSjtHbumWd6ZKRjuYkuntTdV54e0tSlXF5VrWoNjQZ53gmLq/D
	aTy2gYCfApfGjHpwW7d00ow+0nsA84hud8KO1n8vPrx2hfc7sHukmOEUyQSwmdz3
	vgjV/ZIZQ+Wn8cjXY4MrDjuKEHSdQdvtOc1mLs5F7uqwkRwLyP7GzvSR93bptPVl
	PkAT8mZu7ZLgOdmeJ1CABASAhbEPDIvBeyom0briSPi23BpAkw0l/DXJEIEv1ssB
	oREnLQzXkmMwcqIxyujw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tfd93mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:33:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc359d9easo46257885a.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791038022; x=1791642822; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=;
        b=BpuzPf3JmFwV0ojNsTCDS8uh3QAYKOtPIeNbKELV8zGvpbWmW/xpfvWCEtmURm2vGS
         oltFWe1mSRue6iBZRfICUlf1Pb570dg/gVyFgqQmPWaZryCOPsyKLSeM4qop6SAAchG3
         svm5aUsZ3lXNEzsanfWStz7pyMGHUSH/NVe4DE2hKTT57Mxk/dazvDUkHM+dnXSICtd0
         GGkZdD4TSgl+QadMALdeRfm2rUzDdfkVegyfrx3rwn5ZQksmcG2OlJWq7HMUa8+L6PTt
         pos47gFSdEJUxJvH07yLsbtIPQMY828IXqA4mkJXMLQg7fpmTOkJAvjOVN25B59hNViS
         7z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791038022; x=1791642822;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4I+HsFBWbk0PWJr2nHS6W3gE0JKJCyDL9/K2F33AB4I=;
        b=m8+WaL8EwkYVuSYuLa+w7e5DXD8MFRCh3GWTZwVi6YNJD22Y4V9iI82ybq0aG7ZIyA
         LWx4CYQ8o0p47hphNPxAvOrfZ2RMiXNScw8Z+9DbkIzMKrL5G9jvex6kUNF6/Ze+eOJR
         vSXTrKJEssJKzVVueXVFmUV6BJcida9wkeFS3s93QB4wN7Y1Yr3zRcmlaBp9jFXdej8z
         +OMn9U4E7oRPGZGQ3UzN33J5bchQLNXfKbzS9GpIWd/0x++9cn6Cf2m0Kb9QvZVcWeF0
         sc5A7bYQgtl+zXrSR9Pu3T/q4dLxYkN0RlLL5IxltDLfn+mHzKC8ac58HDxchDz3h9/4
         tM4w==
X-Gm-Message-State: AFuF++n2P4mtesv/Rz2SzAbYcHdtL+7ut/8YIdqB3biQp7TLcGG+ZZUH
	WKHneJydWUnwnOJ3sYjH3m0T/zB6sawBX6vM3urLYO721tFd1eWyz0VohCL/cZQ4fpOs8aniv85
	dvbUeRKzcpRdO/iEv34kh7yVM0zBhUW8ZiX9fIoDzBNAAuud+AhX8DceY/DuVRJyvDsE=
X-Gm-Gg: AYBFou2YliexfYeo3WAsF8vQpkEOB6TOAyrmkPlLw3OGyfYILgiqghIMFmj1gF+Tcyp
	HF1dBuLC3F0Z+kQD1fLroD91lzkBfJ/Cz/UO3OtYwK6U+p5Zmgkh9dUSReQs+mvYbrAsZSKCiBq
	L9NbdAyB/osamhxkL53k6Yj9JrynWB6wiAfoG6YaucAy4R6fPOMGrqG6ukuXc29LkNw7TPbRCTj
	JmPHAj1kfcjp0RhKzOLMK9yghXdwhSNga3gODiH5KT7s8asX2XdR5VpFOHYwRGjwFMgIKOtVoi1
	v/dSul3R8kjklf/iB2CfqupkEJW+O138u/sBi0iKL8uDjAXzOoE8UfBikMT8BCBUGrmFjSArRE9
	/TkCXmgZkIrPcpBxcGRAKEdBS9sVBKKPzCF2PFt4IX6P8yA==
X-Received: by 2002:a05:620a:26a6:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93cf18b370bmr1068488285a.59.1791038021654;
        Sat, 03 Oct 2026 07:33:41 -0700 (PDT)
X-Received: by 2002:a05:620a:26a6:b0:93c:9c0b:3898 with SMTP id af79cd13be357-93cf18b370bmr1068484285a.59.1791038021190;
        Sat, 03 Oct 2026 07:33:41 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd055c8sm199938866b.25.2026.10.03.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:33:40 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:33:38 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE QTEE fix for v7.3
Message-ID: <20261003143338.GA928803@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=LroHWXdc c=1 sm=1 tr=0 ts=6ac11246 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=DiaXWS5xduwjvWiepNMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OyyFRV3J8ynSiwfMzYRzfkosEPmTQtUL
X-Proofpoint-ORIG-GUID: OyyFRV3J8ynSiwfMzYRzfkosEPmTQtUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX/SRUzhcVStpR
 cwDYVYZ+jMqJ3rgWKV2gnpsFpRToVy9v8PjZQEo6vNFxNwCTFNw4fimNaFxFMVUP2zkmxEqhwX/
 mMH32+wkQTp98rH6tHEKUl4ZUUahXZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NyBTYWx0ZWRfX51Vt7zec90in
 Zfa0PtJ2/kOj+Lr7gE4j1gE/yHv8CF7j/4YZujmJ6YJypNWdWlkmxQ7y2nIrLmzPJ2D83MWzR/a
 cez6ZM6rKybM18hu7+s6hBVyRQRFXzWJyx4ivztZwPp1R/0tRR6lLKee27ubo4GXLLKOq/LTKKP
 fvo4tnk9pY9W8PrsxPY2NjVt5uHRgP/ZyIjTL/1zsbvrce6mGS5+6c/nrQEkWCprhqu1uFAjAMb
 GbnF0moUWX9k5WqyP2WawGrP2dI9sbVxIWduEI0VAZlvL2ox7yAF/xqjmM5iDMsG3Y9eJWv5gGr
 YYlSGpDUDSYJ1+DEHntExH88DsQHkLUe+Cmbn0gkV/V0nSXOMYIlS4ACJurUi1wvqwL+DlBmJNC
 OX0JcbTgTnpwySLWcc1NJLvJcimiD+fCZ05u/m6M6P5droRxH6NDWn9S/S1igEgWSi0tpG/rzdW
 E7lWPnOFRHo9JMK1lKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030057

Hello soc maintainers,

Please pull this small kernel-doc fix for the QTEE driver in the TEE
subsystem.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qcomtee-fix-for-v7.3

for you to fetch changes up to 93847823b6761e1791a7db10f55bbd4f79fa0dbc:

  tee: qcomtee: fix kernel-doc warnings (2026-08-24 14:49:01 +0200)

----------------------------------------------------------------
Fix kernel-doc warnings

----------------------------------------------------------------
Babanpreet Singh (1):
      tee: qcomtee: fix kernel-doc warnings

 drivers/tee/qcomtee/async.c          | 4 ++--
 drivers/tee/qcomtee/qcomtee_msg.h    | 2 +-
 drivers/tee/qcomtee/qcomtee_object.h | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)
