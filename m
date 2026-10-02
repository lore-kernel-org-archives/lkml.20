Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4E5181334
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935957; cv=none; b=nZs81rZP2VPIPYuT7prIEHRa2NwIirKHqQNGib/xn0GjJgPV6eox3SGnNbpCE93ysc5ggVICNlEXJ7FgVR5A+X4BDZSwCnD2HNiuMMyVbToQTIfu7OOLAlpWXYmDTdBrNMNkuso6hbtxGlkPFUBVAvpGvMD3ltDGPy8qn/cQXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935957; c=relaxed/simple;
	bh=j5hknYjbAhrHkFB9YCmDV6KrI0TqCfFIRzKeeEEMtCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qe8nZhc7FLAElg8PGEopjj9LdkY+eIftz4bglc1A3dgMiPu9pUD7SDT+hcLX+qoNkBt7IR4d7JV0zD1GyxRhtzoznvVWnekFG7GWFB4gpJStppvyFxtjAW1uux/QANpdMxBR4MAPzK7CsphEUqBSSJBMV9vBFFQZvVG9SRJ8EsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmghP49P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OnGO0zuU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmghP49P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnGO0zuU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nYqe557420
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5KWLewQpc20bknaXkPTYYzjyhRuE36PJ9i2
	C59XjwKA=; b=LmghP49PZnGQdJfek+kmzjXuRdlyees65X5OHnDAiqq+O1SqRv6
	GfEuHPaM5a6mHIrTQwp6uiDKYXhLuDRfrrz3eteU+0DblSv1tn9m850SIWaZTawF
	9E6xfnwv140kb/nRpB7Eohl2XWH410H2qWvh76DyQ4ruf6fxJeN03M5jJHyEMyx/
	tkaX+fYYGkIGMhHtJC7yWXU78LbLjINg0vuxQt9oGE/Nmv06kHqDVAb2dNcXHIs1
	ontn313oCBCcgymuRXtwxCTCZCQv4TUXz659wwfBymykQFNfkFky8bwuvy79gg+U
	Ni78yXF/sZBs/tZgadfRKFinUIVx5ygyN/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgbj22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:12:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46c120dfso21020485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935955; x=1791540755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KWLewQpc20bknaXkPTYYzjyhRuE36PJ9i2C59XjwKA=;
        b=OnGO0zuUci7utxQtw2blaGgESfonixBpipevnR27LBZsEY3PvZc11cz8X3M3kQWnI2
         B29BUvVssCENq/KfEjrdSiWXIZyId4cSGw8gI58XQFpEDXZZW9gZ9jn836da1J237Pyv
         z2ywhheEo/ear8tFOwJTu6l7c+0NudgqDNWrUm9RJfDvauArG6Pp0pNaOts7ILlajITF
         hRlrC5et6Kp7R+/DEAJ5dzc/jtw1gpIKXhCRays6tlBmNQ5b7SjIDsHwSAHG+6F0sLxI
         REpyGp7V4Dsz+40piYsj2N76CTGE1wTm0PuhZfvv/Nv1wyk+tFT3fUl8BgCnpWET6n26
         Y5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935955; x=1791540755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KWLewQpc20bknaXkPTYYzjyhRuE36PJ9i2C59XjwKA=;
        b=yhuYksFLah1zgDhpVSQ4zOdwdgU81V3jz+w7ysLnmdbWQlTTLFFIODWVdQuUGUbuks
         OCOYDUe3hHQH3GJsBSo3G4aaqpl/1I5zNfhryGvU7fZ0l4zL0SqM55gp6uNmRNTEWe1h
         Ad1rPpd1g/EAUdWG1lzzxeN6XZl5JGHP+CzPOiizzvW4tvjaXlDEoo210WUq86lcMi0S
         tM/IRo7M0y2jYX7d8a+QEsi5elArfaXYqPOBfkSdvVQgBbiwLH2eCBFjKSivLZEOUeTG
         m1NRGMWvlz/uOGVICLo3wIAcW3R5bBb8Pn2eyKy7yGqAE6Uo/w05ayCo+RVdR8hTmZI5
         G/2w==
X-Gm-Message-State: AFuF++m+JxclBW+rLR6yDzy5nHVnVJqiSIjRAFpC9/rhL4V7i6zUL90E
	cgpIY/aMGPY2G/XO4M2Cs2mspXIeu2+SPzYsm3Y0dEQUlXMTFWwAJBJz3a0nTafuAejm3L/6Hik
	NR6N0k+L26jdL2y6mHGyqhNa0Ybs5WatEvNi4Glnn6+msxJjIbdwc0T6gHcTFK3BE3Cw=
X-Gm-Gg: AYBFou1yNmEce9NWV4H7MWTxM9CFzdFhO25v76T3qRolr2MjI0aRc1FQIBbzWFOzkaG
	Ur1awsI7A+6+jGmsU8VCFjBhjP0MMITEJ/U3y22P2fYb42N7mJgQxIWY+2qXExHlGhnqJTkddfq
	kHCTEpbaXhcJdQxJczPm+KlBnFS3XODYr+i5eqaSzb7t5MndGLlLxRFrZ78OdMp1Bxb2qE2FrzM
	+XJA9pdxRR7JXkF0eY8Bi5PK/b0SW/JBlKclzSQ6Cvs0xrJZv3tlea8NnLZlZi7vKwncZvLsqX4
	ICVjpNFu1m6RbM7HgZmCggaz3w9rHoYzPUkflHAMlztEQC0PX7NDsUU0KlhiYloty8itDxUnz/K
	990COrO0kAqzb
X-Received: by 2002:a05:620a:172a:b0:93d:78e0:30b2 with SMTP id af79cd13be357-93d78e03281mr261035585a.29.1790935954396;
        Fri, 02 Oct 2026 03:12:34 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93d:78e0:30b2 with SMTP id af79cd13be357-93d78e03281mr261030785a.29.1790935953835;
        Fri, 02 Oct 2026 03:12:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm39689195e9.4.2026.10.02.03.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:12:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/2] misc: fastrpc: fixes for 7.3
Date: Fri,  2 Oct 2026 11:12:18 +0100
Message-ID: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfXxFRYCThD2vK0
 +OMnDa3j10HhLCD97E8ZfeSw0CCwLjn/VK1QVBbDIFiTfdbt6e6frUsBHilErddbiQmvOuH4A/M
 wBJw7ERGU7XjOMhNKT3e3EnEJqOI9wQ=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abf8393 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=4X4XtrbmYTjnvJMIIIEA:9 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfXx/lydx0ifp9S
 7X/s6kd84+nUZvVGTnnwhW8LTVi+CABDrq9XgegGx8zmPLRpQq81qP+KfNBbs8VNx1B21jUcNat
 rDepNqb6wdvcY+G9y7C4Y9+OM78posxa9VC1YVlyOs47N6JRaSoZOI7eiGk70EUz9PGgOF4Ri7J
 zVA1yMCsDRigOM+o0W8l5RTIQmrqdOlZWkxXdplfP3XY1PM3hllLxkYdpR3777MsppPbTECRpVu
 ZPb/M1k9cG/k3I97kYsZHTCirUJU5epa8X3uTCsftLseR5ZXGDLF9ssK0nCL9VhDwTHpFYat4X7
 bwS7yAUwVHAZ62IxUDwuNVVslpOUZO/GACBaU4GnHUIE8v8X5qPJNnHIlJugNdnK/yFpwbyMxJU
 B4YpVe1uQ2BRTBWuAhCPvITAndLZMql4EpqfQNqw1uDBW4PxnTySkdtU9oEJZT3Dgy9hIMUKfle
 VtB8i3IH/NRgwnOGQCA==
X-Proofpoint-ORIG-GUID: UkE6zds9Jhkw40-fqWQZB5RzqRW7nS_p
X-Proofpoint-GUID: UkE6zds9Jhkw40-fqWQZB5RzqRW7nS_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few fastrpc fixes for 7.3, Could you please queue
these for 7.3.

Patches include
	- fix double-free in fastrpc_map_attach() error path
	- allocate entire Audio PD reserved memory in probe to avoid
	  userspace-controlled alloc/free and unbounded heap growth

Thanks,
Srini

Jianping Li (1):
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

Yifei Gao (1):
  misc: fastrpc: fix double-free in fastrpc_map_attach() error path

 drivers/misc/fastrpc.c | 192 ++++++++++++++++++++++-------------------
 1 file changed, 103 insertions(+), 89 deletions(-)

-- 
2.53.0

