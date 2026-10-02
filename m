Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FE2110E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899667; cv=none; b=fUf37ejdWhXH8eRgGmuych3jhhfvpdSOkzYp1kQyw9fat0kaGvJ2dvpwAufWeYzWg/u9k90kTQNV/D5dPeV6CNEX0g+cMIDDe+l9sY9JgiAfVuikpFqqo9XZwxej/YZ6GS4JtRxMR5+Qat0vNKt7T7MDJ/kK+XvKVNlXYPlfh0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899667; c=relaxed/simple;
	bh=6rmt054WcgR/sUykGVDW9KdieYf0NX8FnzjOGrZpeiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=d/Wiqf/amIISBXucYFDbww7/w3Dvqj9uzP+iQgJr1KCCrk3GyaEKNDV1dU8e/tZowyqQU+tS7QIGkuqkM9q7ll42b3s8k6Wko0n3g5sWfd49v8CvfP3o1OJlm3h0K9aUJvngLL0FmISGyIJA3+kh4OUYnrSSplp5Gq5hyzvAAgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoK+LnhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aivm4wKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoK+LnhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aivm4wKv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NESQ5099904
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 00:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QsPd4SyGa+WJ71aCuvBXvF
	F5fEVwvkPkzB2deVo6AQ4=; b=UoK+LnhZaJfHoRD62G/eucYr2PdeCG+5eN5DoY
	0WuiMxIAGs+3fp6CvfRXxOYGuk19+WV7K0lvu+/c9jaO6rpn7cfupHb91uIJXtWe
	kRMIJ/4mdLi5jOG3RdRbx24WhEm29jp63Em0jR62r0p3mbeBppYaILQn3z8x/TA9
	LkvFj68T4xnYH0WBtYMILe8EfJF/whyU2EaWpoIoI7GO8PrT0P5RMrzPVC5cfvxp
	0cbdP+uvV4GGOWul87OdtAucBFneSwy7M/NrDkLmK6UhN8xZ1JyAbIgVy+f/fExd
	QgoWijROy+L8yp/ZTWWgbpTFFjyEIa3FDLt9AvKAR707/2vw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh06c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:07:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so13741911eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790899664; x=1791504464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsPd4SyGa+WJ71aCuvBXvFF5fEVwvkPkzB2deVo6AQ4=;
        b=Aivm4wKvSIwZSNflkn+Q/lzq1/REx9FhOAR9LZ6qV/SWr1Elg6wQSPDnaBi39ciIUI
         e2apfc9chiUtClOv07k8oL7Vqua125uXWpNIAYt2WsxeA/8B91J+ao0d6lZ2aNNLVReR
         GQzoqj4TaobG6ihYjpCtrv4EKTZ7J8gst4DVHPc27Kbd5dHEWCVGpl0sqFwCvfnY2YW/
         YF5EpnxFwWjUaI5CKpnfnCUDzYdL7foAaC08Qzg3kEJjPoDLUmqa4QI1dlr1kPu/ITSs
         rjy54slqPuDxV03QvdbbhqFri5HktswL+tMh6q4uFmioAEXL+B1+RmdKgl70DtbjTvZz
         8Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899664; x=1791504464;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsPd4SyGa+WJ71aCuvBXvFF5fEVwvkPkzB2deVo6AQ4=;
        b=pAcEipI6r/EA4uxSmyHREs6BZFsxTP6d7V0E2wymin3S6q6peS+n6pwxpdfaZ6lrn7
         I4xH3X6DniMWXX4kxhy5rY7j7xz0sB5Vt0pH3YojcvyxyE1SISY8ZVBf4K+2IebXFwVm
         IFAmwevSB7Oms94/fOLVQUYMV1W7KlP8+zoBoOXKLez/7S3Cgf60qMWmi+SInEezLZDB
         Jp9ASipAvZSclB1ty/551hM2t4xHVgXL2awxM/QE9B03LwqW8xONQN6cBUt2CXI+UM7F
         kPg+MJa7budvoKsOwVDSgV/YU6sYxAnOVQRwVjXqoUpInRMOGvcfV8+3XoH1OTeg+WyH
         sOug==
X-Forwarded-Encrypted: i=1; AKwUvBwFnTBwq+toc3tGKY0R5Nq1VYJOJ6ZoWS7EsDIKyLu4K6y4pQMuEv/lgfmPVv4+md+WDfyyRA0HqH6znNY=@vger.kernel.org
X-Gm-Message-State: AFuF++nq/z9v3o9XFGe5Lpn96gxGkMrmJBpMyN4Ct828DbtaLIrk6bva
	wwNv+ulCtOS6ul3t8pvUveT5zjxm8Hvb5JRqPodSzypvku0LhEP01kq2HhLW7b7Vl6LEqW+pgj3
	hhuekmXix1ukrCuN9NApQcvBacdH1axc5g/6cLQRcuGBSCoC/INgvS87Ss28N/f5TdGc=
X-Gm-Gg: AYBFou3QPj4z+VoSSS+Qhx5k+S8z+E/SOqU28TXNVu7QdE0j38NCtkmw04KCSHxJKN+
	ENLpJgfxaOvkC04pvelsQGWGSw83ewMkgovwsmJ2ke3MKTGYRp/1oS61qsGjujWYtmwJqvywmJr
	CPl6X5BKzIz981HmNcBziq+8PpisMpIp9XSFaRa3KaaCihqsgxU8TJtRuZREW6umYqxbCkxeM47
	H1qicDMomR0lNQ0D8WOlf84+8p1wq5KXEXRgttc/FVIQETM1xzWWnjr/3U+xHg/PU0UdxjE9kRN
	o9zvoebendVsPf0i1Ls4eOmsmK8ZTzmUzJpeeorMtkEd9RbRYyg18wx7knoxxj9rzF3BkvqUWDE
	+FQjb2vDlGpA7BtpVi6ybEWS+bzBxax0EX05TDav54/+XKPj1J4m8uw==
X-Received: by 2002:a05:693c:638b:20b0:34d:60c3:3957 with SMTP id 5a478bee46e88-34f21859681mr963617eec.24.1790899663530;
        Thu, 01 Oct 2026 17:07:43 -0700 (PDT)
X-Received: by 2002:a05:693c:638b:20b0:34d:60c3:3957 with SMTP id 5a478bee46e88-34f21859681mr963590eec.24.1790899662923;
        Thu, 01 Oct 2026 17:07:42 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f660f1sm1561300eec.13.2026.10.01.17.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:07:42 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] usb: dwc3: Clear SUSPHY before issuing core soft reset
Date: Thu,  1 Oct 2026 17:07:40 -0700
Message-Id: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX+cOHTyEZEMEG
 xnuOkVZKKDlw23qRIg8xbuL4P52yjntsITQXLca11B3lx6HgDjpMH/lSUmdUqTQjFYAw2RhRYh5
 UthghDKvakYd9RjpR9++GqItw+fPMkI=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abef5d0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pF2x2taR6QuopRQjwAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX8Sy21Al0+dO0
 qGeBgUdKoA2Yz1+lfRR6IgTE1slKjy0hrATAG8EgCe3EkRf7iy6s6oQJ+VDDnHr5WVGbesEd26s
 ssH/5XN6PpjnHJT88yfq1JEiVeLoWR5gZbYdtl6lL3oQnG0fnlJ6pipQjQM8+7Tv6+/Ql6ZbiIL
 D26exZbmdfj3Lw+/4TMwCikd03ELPosRvrrzdWXfFO39gvvZuMFTuvADazVD3pppYWNdswdR1dm
 OKPNVRsgAljCvYnI7AOm46ZPHshkuilcfU8VAIkKo20yGVb6jY1opLI3wVBORuu8uNzf+HGP/BA
 N1qdSV6m259LkY/CVUbYkD4GphCfHkwArKpJKGSS7cdR3JxhpLXaoXBUeEnrlHAh8q+ZJhy8Vq8
 K3Qc1MiPE2m5wffwF9+pdY4HUMuYCYv2/cF+CNOX/wRD8ocR337RMpZ9FMGhTOqYL58jbxE4U7B
 18NGKoZwrvC/+OnPBkg==
X-Proofpoint-GUID: -fqnpyL_XC01E-cd4wlvbcx87NBM0Ju2
X-Proofpoint-ORIG-GUID: -fqnpyL_XC01E-cd4wlvbcx87NBM0Ju2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020000

We are running into an issue where the DWC3 core soft reset consistently
times out when snps,dis_u2_susphy_quirk is not present.
 
We recently dropped this quirk on our targets to allow SUSPHY to remain
enabled during host/gadget exit paths and avoid controller faults, as
part of the changes introduced in [1]. However, this exposed another
issue where dwc3_core_soft_reset() fails when SUSPHY remains enabled.
 
The failure is seen during the following sequence:
 
[  126.110298] [0:    kworker/0:3:  671] dwc3 a600000.dwc3: DWC3 controller soft reset failed.
[  126.110347] [0:    kworker/0:3:  671]  dwc3_core_soft_reset+0x3b8/0x568
[  126.110352] [0:    kworker/0:3:  671]  dwc3_core_init+0x900/0x17d4
[  126.110356] [0:    kworker/0:3:  671]  dwc3_resume_common+0x5c/0x394
[  126.110360] [0:    kworker/0:3:  671]  dwc3_plat_runtime_resume+0x28/0x88
[  126.110365] [0:    kworker/0:3:  671]  pm_generic_runtime_resume+0x44/0x5c
[  126.110369] [0:    kworker/0:3:  671]  __rpm_callback+0x94/0x3b0
[  126.110373] [0:    kworker/0:3:  671]  rpm_resume+0x43c/0x64c
[  126.110377] [0:    kworker/0:3:  671]  __pm_runtime_resume+0x6c/0xb0
[  126.110380] [0:    kworker/0:3:  671]  __dwc3_set_mode+0x48/0x580
 
This occurs before PRTCAP is programmed, where mode-switching
code already explicitly disables SUSPHY as needed.
 
The attached patch clears SUSPHY at the beginning of
dwc3_core_soft_reset() so that the PHY remains active while the reset
is pending.
 
I would appreciate feedback on whether this approach is reasonable and if
there is a preferred way to handle this.
 
Thanks,
Elson
 
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e1003aa7ec9eccdde4c926bd64ef42816ad55f25

Elson Serrao (1):
  usb: dwc3: Clear SUSPHY before issuing core soft reset

 drivers/usb/dwc3/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1

