Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA6D41F5D4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378782; cv=none; b=i4UYBmgQn6fyEb7HncegTPruQZ/5mWJPp+QDsyexbs1zooGktTcBixiO7pymUTJSfhQicGWrZp6jHFZifnlFxGVutGeJbYGKwxOaPT+G/DMjqW0211H97eER6Bk+t3bNhKOqTGXcgG7J0SQ5WvRJS3rgvOEvFcYF41ZqbxOcmcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378782; c=relaxed/simple;
	bh=fjPHKJ99+6/YYqBG7WRX+vjmWbKlg+Pq7IG5ShfV2Mo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ObuM0Q6h8GjHEgWdjXG0120QtwQq2FGngQOQKiZhXHOrG5WJCe4pKqzeldCoFeimTFz+JKfeFmYK9+nbD700cmNkA7D8uK8/qQcr11FMvHdRfHG5aoC/UaPAxtFVI5RffmilUB07WDJMqp3BHLPzYVYaTpZFLuSqYUjtiTx2ylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMrTDdO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCHtlMjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMrTDdO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCHtlMjv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8Sbav594655
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9bQ4YU3lf2Q7aRmm0fsqRK
	c4V3MxEw0Tq9J1jmu9YoE=; b=jMrTDdO23rQOiTJgoZtDVUUPoN0p5YSN4Yn/Mk
	Fhmk5o8Y5nmusXfzvGG6kxzeirnrifpYMBQGCmSp//zeT+pm++wZ7/ShjqOyw4aS
	c06T1PElP+7B8d95J6YEqIncgtpquc6+ltno9sw26Vax9hVsIo/JZxdRr7eFFviX
	kDD8Maf0V5iGODHqDG6uWf1c1lyNxxQhqYQ0/ni/Q8RUy9Fxsprlm9noAkXXbCgO
	bLFXB5Ft1shLJoYhKNpEkqPwSMgmSt+cZZnoJBQTnPL/EnXpKL5YzflrKYn+LNcQ
	XY9yR+5j4fRdIJ8NKgFVJL0nX6xclAA/eprVTGIAvzrbGjdg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr7t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:39:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2577615a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378777; x=1789983577; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=;
        b=hCHtlMjv5w363hKkvgg1O/FAbNTPwLxQO7NWJx72FPVyeXcQkAZEUGb/XNoGB3N2vL
         pBf7LrOfOhMPG87Ek1eF6fy83QEC5aVI2gWW5zVbRClJsE493t6nFLgFdNNfz/1WyQ8Y
         sHziDHkxIK4tKKnndtadqrLDL0Z4HvP8LL+W3/9nHv3CxjGoevp6OVyFe1ioMZUc02P4
         X5YlqDa5CUd82pOSTJ79uRQymNvF9QpwkQ9eW+O91qIypxViHi/6RfBfIewdBqOForkS
         6/Z5x/j2s19RY/Dur4EmqD/5WIa0ZeMu3N1O7OKDdt66Fhkf5g3lFJvFx5tTU9VoCl4C
         dWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378778; x=1789983578;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=;
        b=Jk67pKE3pDWWBPz8YyBmIoSfgOA8dECj4mknYOocoLgOV5Gd0w4cyxqf/t0uCFD8BN
         WujNb1khZQrXzdBE71fusUHUiHpnhVbHB5tlI4nTNE4GCMnc+mfEYC3FFufJTH21cp6o
         0ZiHKUoQk4+J7vtkC/QsboVeCb+8/CMw/TlbfMQV7yaa6f/Is6JwDrdAl/3AzhdvOiyc
         SdobdnuhV0GULShIpsoCfIimKwXsP2EMg5todtyFuWX9U8oTizqt1FgJ3wcmnxTcWmfF
         t28a3ojzmCFzHqHPIHrAMgSCAuq9hXuDySigsRFQSl2v9DCde5fS4yroUm5F6rozivQc
         DoAw==
X-Forwarded-Encrypted: i=1; AKwUvByE1WEqvSMaBGLCPTskHe5YvXa0Q4vMeaEQYSM9BbLcwH1PnOG22JuyirxQwIpylB8n8DoFRcosrhOy7SI=@vger.kernel.org
X-Gm-Message-State: AFuF++m4aprhS2cpMRBtdrdbwx4R7Faaf/gI5f87il3ryq554lmPCaVZ
	rc1rjLIthF00f39OeYIGN75WjjmpvyAIo6zfqmWRb+SQM6Dk+07Qao2ewRtESuzg/nfEKDmLvt9
	/9vYYrS6xpqq2/AtasgF6pWHNBeO+bCk+Yjo0M8t6N7ZjMwuO5JuHkgcG0GvD1UNuFag=
X-Gm-Gg: AYBFou28X2LHJteTL2Ejz+bEkR5lZrBRhL/xKCED6O5spYo9jmbncV8Clp/KuGghcoH
	NBk5DtI28xfE4iwE5tYrtBbxVmSagHKOa+dv7R7EqOgnoIfOKJRcok9NVVZmUXFGssPlA2naJ6b
	XX3+z/Q11hB94Y4FbEagEpJ0hQgqV8v8cnJ2sK+U9I/pIwouPuRgSaXzErTzf9s9CdhMSQGvzKY
	wNcpEgJLu0O060mtzH9GGOAK8C4fNVatQ/VXzJb+IWbOG1YIjYextxBHBhczelYbl+NkRC0eZol
	s32KPL0PZNZ1/+JgSXfJ8O7laa9dZUQAgaC93k1M/8cVAPSfz5zhLPB99WNihiDrQqt95/tAV2S
	wsemnVbF4yhN14MWEXMhIRJi6hhidXGNIaYOPF/B4JBoLbDgNxDVtD5WO
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4246066a91.16.1789378777499;
        Mon, 14 Sep 2026 02:39:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4246008a91.16.1789378777033;
        Mon, 14 Sep 2026 02:39:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:36 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH RFC v2 00/10] arm-mpam: Add basic device tree support for
 resctrl
Date: Mon, 14 Sep 2026 17:37:48 +0800
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHnAp2oC/32OzQ6CMBCEX4Xs2SUU/MOTiYkP4NVwKO0qVaC1W
 4jG8O5WvHuZZCaTb+YNTN4Qwy55g6fRsLF9NPkiAdXI/kpodPSQZ/k62xQCOyc79MQq+BZ1wHv
 vkAfnrA+oxEorVcilLLcQCc7TxTxn+hlOxwNUv5CH+kYqfLnfWmM4WP+aP4xiLs9zW/F/bhSYI
 cl1UW5qknpV7i1z+hhkq2zXpVGgmqbpAyjuxULkAAAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378757; l=6993;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=fjPHKJ99+6/YYqBG7WRX+vjmWbKlg+Pq7IG5ShfV2Mo=;
 b=G6cSHOVN1KD+oQ8XYfHE9H3vN6W1t5NoY5K3ygsYz9Rh+3PduIxJpk4b7CYxU+kwL1D3oeLDv
 qmtkvthUP9RDap+QGs+epUxoEAXOSYckHHT/KYIEx6f+txONDI8Y5jR
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 2szcQGqJ8InrCqkKIKLMzBZjycD9Yltx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX/1dPN4AxUIUl
 TrZ4u51rV7H/T4NVMz8CwFSzM+LB+HgAxbsUXQ+1qqDaofOb/KGcLap92+VjGPiW5o+XdjVN6tY
 G1W7BnxVY+zMp5/6jh6+U4tG3hmacgQ=
X-Proofpoint-GUID: 2szcQGqJ8InrCqkKIKLMzBZjycD9Yltx
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7c0da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=eVJKr8h0iHB_2sIDOaAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXz+7tj69NB0bQ
 Tt61KWwAhQsFxnMyx2RxBhRW503ajKgtpJd2Pd/uxK+XwH9nyIMNTS7ZxbIWabni3Y7+38X7F4G
 8c7Wv45xlhRvm29dhpFnTg0XxfGNPYhnEI20ZUk3OJzv1aFfdbgAe+eNomBODLpnBHsXfeFwjtk
 zuBs3vMvmKLo4HAmAnFn54NJ+ulLRmgBHKwb2S8HzN9LBil9nRR+MsvCHvUBWYMRoNEljw11TMD
 6KHjpQPAT/AVFaRF3W5ELrdSi2TSnF3SiXoGsgDb1CXnAz5aMz76J6SyMIDW3vvZxfZZJ9mVhIR
 FkjZK5dtGEVIVCSbbtEzfQyNK8vxLSOLf1oKhHcHidvISbo+k9WzPawPO6vntu84dacmzd9QtRb
 T2+NR+gDsWy8M478V2nxfNR88rroZf0AF9rtzwkf/Q3eOWvg+kF0iDjkPeTtGtFaw7hwSb+RE6Y
 en2L6xPS2U6lEVhspUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

Notes for James, Shanker and Rob
--------------------------------
This series builds directly on your not-yet-upstream MPAM snapshot
patches from the mpam/snapshot+extras/v6.18-rc1 branch. The RFC (v1)
went only to linux-kernel and may have been missed; this v2 also goes to
linux-arm-kernel.

Please let us know if you are OK with us picking these up and extending
them (original authorship and Signed-off-by kept, changes annotated with
[Yin Li: ...]), or if you have your own plans to upstream MPAM DT
support, so we can avoid duplicating effort.

Add Arm MPAM resctrl basic device tree support.

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The patches are based on earlier work by James Morse, Shanker
Donthineni and Rob Herring, with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

New on top:
- dt-bindings: schema and example fixes
- arm_mpam: fix foundling MSC creation
- arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

Note: the MPAM DRIVER entry in MAINTAINERS has no "L:" mailing list, so
get_maintainer.pl does not suggest linux-arm-kernel for these files.
This series is Cc'd to linux-arm-kernel explicitly; adding an "L:" entry
to MAINTAINERS may be worth considering.

DT affinity model
-----------------
An MSC's CPU affinity is derived from its parent device (cache or memory
node). When the parent is a generic container, a per-RIS fallback
resolves affinity from a 'cpus' or 'arm,mpam-device' phandle on each RIS
node.

The Kaanapali DTS patch (marked DNM) is a local verification example
only: production firmware does not expose MSC register access to the OS,
so it is disabled by default and cannot be upstreamed as-is. It is
included as a reference for other platform DT authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes in v2:
- Fixes to the inherited patches are folded into their respective
  patches with [Yin Li: ...] annotations, as requested by Ben and Andre.
- Move the RIS index range-check and MSC MMIO window size fixes to the
  front as standalone fixes to existing code, with Fixes: tags.
- MSC MMIO window size: reworked as a genuine off-by-one fix using
  resource_size(); the ">" bounds checks include the access width and
  are kept as ">" rather than changed to ">=".
- ris_idx: validate the range right after of_property_read_reg() and
  keep u8 downstream, instead of widening the call chain to u64.
- cache-id sentinel: keep the ~0U notation (not U32_MAX) and leave
  cacheinfo.c unchanged; only replace unsigned long with u32.
- Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
  variables from unsigned long to u32.
- Fold the device_node refcount fix (of_node_get()), reviewed by Andre
  Przywara in v1, into the DT support and memory-controller MSC patches.
- Drop the "clear mask on error" patch: the caller ignores the affinity
  on error, so it was unnecessary.
- The foundling_msc fix and the binding schema/example fixes are kept
  separate for now, to be folded once reviewed.
- Link to v1: https://patch.msgid.link/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (6):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
      dt-bindings: arm: Fix MPAM MSC binding schema and examples
      arm_mpam: Support MSC accessibility derivation from RIS nodes
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 400 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   3 +
 6 files changed, 636 insertions(+), 38 deletions(-)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

