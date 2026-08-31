Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627EE3C1D4D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159337; cv=none; b=fZ8U83/p7ZNf4Y24gwImL/c/RD+lTQ2LATvVX2CiQmFMGAcbHkA0S2aSmINWP33V2rXs9RIZtXzMz5e0Dgx9FLjhBaMqIAFVPDMfufYSRjjNuse2Uee0rW5L0pGF3T1qNYBOVA+tqqxXtzXpUb3RtC0RIK3acecSQoe43vF1PCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159337; c=relaxed/simple;
	bh=CfVfJUHR2A5oVpL+GviNevQUQkorCENLhgE2Z+EER0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m4IyuxkeS0QC5uaDJB65Dj75xF10ThWx8WaKQBqI/8jsud2BH9RYr/iRwlCCrPHe4x4APALyZCe0pPxkyoCK4PX7SOImFtTYDMkjijfMPa6BjxyG1ecZP/p1ZTCaBVXOlvAXyX+AHF/K9PKfeF9xrqrCX/Aak4PJolQqhTg5DYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BXqOkwkz; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BXqOkwkz"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V533Bf144421;
	Mon, 31 Aug 2026 06:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=trbNlzglQFfnrW3Ab5irythVLtnOnGXzlgEPIKdI7
	8A=; b=BXqOkwkznzJ9RutY8RNG3Nht9fscknsyiHRLRg2g+Fgtr1ICvPBu/ODqm
	dVnJU5KD/fu0aZVvv4bVcruA/rHWtYAx/xaLIiIgu46EQV+M61oF/ijobRtBoQba
	2JHaoC3tqesf/qZbF2n1l0cFhGX8aPUiKPYqnZcbaplAJzMxK69rRPQt75cz5Rue
	sH7eFyp2WBlxzabYExh23xYh1ol3bYUfoD5dumjof3ZtQIRHYme8GBMwCq9dRs9l
	CHQYClf9OrRsD4FTGtUWJMvTknf70hu+m3Sb+NqZLfDj4s+w7DSEjQaKFAzTd/w/
	tI+I+wLxCelB/1UtEwVMGYEFJLydA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnudfnnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67V6fQDG006040;
	Mon, 31 Aug 2026 06:55:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcarjvejg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:55:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67V6t00945023594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 06:55:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAFA82004B;
	Mon, 31 Aug 2026 06:55:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DE3720040;
	Mon, 31 Aug 2026 06:54:58 +0000 (GMT)
Received: from Narayanas-MacBook-Pro.bl1-in.ibm.com (unknown [9.123.3.199])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 06:54:58 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, oohall@gmail.com, npiggin@gmail.com,
        tpearson@raptorengineering.com, alex@shazbot.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, sourabhjain@linux.ibm.com, harshpb@linux.ibm.com
Subject: [PATCH v4 0/5] powerpc/eeh: Add RTAS-based error injection support on pSeries
Date: Mon, 31 Aug 2026 12:24:36 +0530
Message-ID: <20260831065441.48654-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: KXMmDOMv7DQsObhkD-K_YHFYdw_Gp1Ne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX4pK1LK1LCbr1
 KLe2uJER6CnIrrbyzqkRA3oG0oK7rw/LiYt2tJCIn8wzu6F4D9rKqNmPRQ6hdkZZdwxbBJTmQqN
 rhce/a6Z9djs1HOorBkEplDpRGv8fHoEkzth3YWMcCA/wWkHllFzT+nuFdplQFtqF+ZEeN07/uz
 nXfIfQ4uOOzSVfzp6CD4bo7rb5FbvWDBTGrRuKKIhGpxw5mdwVFyYNJ8Wl+CLvzatJDPnAhZn7o
 0Ip6TxMn7eXvz9QEkPpveQ4rLcMgcPjS2PJjM00WlLwWCBpkrvp1m59HSh48+8jq0mvbOt1W5uH
 CUUZXUfVOHFsB0pWCglWc99Y1xvwlpGj369/1b4lztFB/0xPybdYGhFidQUlaFrJLqkkQDRYesD
 cfWh7baknZml0g/JCwWL/xCcQuKGR0/qlArQ1uR0jLg1MsSs77h/BQY2TyLpkgeWeaqjbknMDTO
 CoQHH7cPrTMH4ilXv7Q==
X-Proofpoint-ORIG-GUID: 1MChuCHBQwh6rsc8z4chDQzpo5IM36Hv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1NCBTYWx0ZWRfX5rJb7ya/K+ub
 nz4srQIA1p3x3vNpyngxPlPWDejutM50OT+InEr1vASx1ds4DA0CZ2Tz19rwvOGupAUpVkLuoU1
 jTSZOBshM7yYe1Zdpjr0ejjmqKADJmE=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a95254a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=7bBMD73HTvO3Zjiz8NEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310054

The pSeries EEH error-injection backend currently implements a limited
software-generated MMIO failure and does not use the error-injection
services provided by RTAS.

This series replaces that implementation with the PAPR-defined RTAS
workflow based on:

  - ibm,open-errinjct
  - ibm,errinjct
  - ibm,close-errinjct

The implementation opens an RTAS error-injection session, prepares the
firmware work buffer, performs the requested injection, and closes the
session on both success and failure paths.

The existing EEH userspace ABI is preserved. EEH_ERR_TYPE_32 and
EEH_ERR_TYPE_64 continue to represent generic 32-bit and 64-bit IOA
bus-error injection requests. The pSeries backend maps these values to
the corresponding RTAS error types, while the PowerNV backend
explicitly maps them to the corresponding OPAL types.

Additional generic EEH error types (EEH_ERR_TYPE_RECOVERED_SPECIAL_EVENT,
EEH_ERR_TYPE_CORRUPTED_PAGE, and the cache/TLB corruption types) are now
defined in the UAPI header and mapped explicitly to RTAS firmware encodings
by the pSeries backend. Platform backends that do not support a valid
generic type return -EOPNOTSUPP.

No existing userspace ABI values are changed.

The current injection path can be exercised for VFIO-assigned devices
through VFIO_EEH_PE_INJECT_ERR. The guest or userspace VFIO application
continues to use the same generic EEH type and function values,
independent of whether the host platform uses RTAS or OPAL.

The series also handles the unusual return format of
ibm,open-errinjct:

rets[0] = error-injection session token
rets[1] = RTAS status

rtas_call() now returns rets[1] as the status and places the session
token in outputs[0], preserving the normal kernel rtas_call()
convention.

sys_rtas() is intentionally unchanged because it exposes the raw RTAS
return cells to userspace. Userspace therefore continues to receive
the session token and status in their PAPR-defined positions.

The RTAS work buffer is allocated during RTAS initialization below:

min(ppc64_rma_size, RTAS_INSTANTIATE_MAX)

using the same accessible-memory limit used for rtas_rmo_buf. The
kernel populates the buffer through its virtual mapping but passes its
physical address to firmware.

The complete open, inject and close sequence is serialized with a
mutex. RTAS busy and extended-delay return values are handled for all
three calls. A session token value of zero is accepted, and session
state is tracked independently from the token value.

The patches are organised as follows:

Handle the special ibm,open-errinjct return format in rtas_call().
Allocate an RTAS-accessible error-injection work buffer.
Add pSeries RTAS parameter validation and buffer encoding helpers.
Implement RTAS-based pSeries EEH error injection.
Explicitly map generic EEH error types to OPAL types on PowerNV.

Testing was performed on PowerVM with firmware providing the RTAS
error-injection services and with the corresponding QEMU support:

https://lore.kernel.org/qemu-devel/20260520095446.64206-1-nnmlinux@linux.ibm.com/

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

Narayana Murty N (5):
  powerpc/rtas: Handle ibm,open-errinjct return format
  vfio/spapr_tce: Normalize EEH IOA error injection addresses
  powerpc/pseries/eeh: Add RTAS error validation helpers
  powerpc/pseries/eeh: Implement RTAS-based EEH error injection
  powerpc/powernv/eeh: Map VFIO EEH error injection to OPAL

 arch/powerpc/kernel/rtas.c                   |  78 ++++-
 arch/powerpc/platforms/powernv/eeh-powernv.c |  27 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c | 328 +++++++++++++++++--
 drivers/vfio/vfio_iommu_spapr_tce.c          |  90 +++++
 4 files changed, 484 insertions(+), 39 deletions(-)

-- 
2.51.1

