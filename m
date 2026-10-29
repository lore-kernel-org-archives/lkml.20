Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279377;
	b=DQT0s/Er/esQNyg3Y+F8pXMEdow39fxakSmKTNk8K4WRbvbaW4T/166repiW4trxuV0K
	 P1sKrV+WKoP0gBdZbAgSQ+RaVSzqNz7s5GaYVS8dpk/83gwHa9JB7t2RtOEMGTxy4GDuc
	 nTQIHPhfipc8mE0WOJ/4r/pYsRMlAX26Odeh3kunI0d7bj0q9kXnJuGBtCsxsVwRB0Cq7
	 LdnRXDOvnZFywNu33Ikbs+ExTZprEsC8kjanf6E9U7yXh+b4UmWVtJ0G92X7moj1V/zKQ
	 aEXjTZsN1zhZGObnvsdrITqaDb3we2se7O17kLIs9jNAhbLlxwYbjuwXveV43rL1XNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xSmTw3rKUw=;
	b=cauq1VQfdCzlulng1S9A7L0lBUgXpoJk0bopOtGAK+3SuemE/xS4RUnsewOD/AsW2VKs
	 d+/sdP758fek63X9NupOiqzurmt3RbgjwiIDjjZ5pNnNWgKt1v2QZBYmZA7Q4D28IGOP+
	 VaOj9d9ZtGW9LsJX3yrRt79anBrbcrTMzZh+Fwb6ekYn5ckPxFASfr3yuzRqSQ2gZfe2g
	 zfDxD0i3HJajzFLscHjVJEBp9p7sOTOlKz/ZnLDpGbq4GO6tLGMYkB3Ds+ymNMXLBlE8o
	 z4YHBwAf7PF3QZuY7z8PDGgqKQPL6wqL4JeTdvbxdJkQpIkRwk3rnIDGJZGZok1U8ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CEM4DbK9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QDCxeuR7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C34606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C34606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CEM4DbK9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QDCxeuR7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCePVE3215086
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xS
	mTw3rKUw=; b=CEM4DbK9ogNGZwmCwwV8zL903+EsrG0822kSe03YTJy2qBozhEs
	iqCQYBGLH6Y8TyNL/ZN243O8O2d8NV/M+LwbtXVjT0GLyXXnxKbtD1l4SPedNT35
	yzKm/WT+VBkxHp+ZVIJKgBOL3YDFnsnCwSgmrHXIlkcd2zWxA/bPU379f7rU4K2g
	+d28R5mub3NmlF6u/zMIqiWaIenLzFqjpHPpok4r6+82aY7As1qfd/zLfH0WPZzy
	pZv9V5K88liLU84IvtUG2VrPFJujq6j03omG4euIQFyn9Cd+XMkEFJfFKRZKbJYz
	iD6KD0mxhCkMM8AHuZJ2FEfvA1tY/yHYgnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s9t03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso1576644a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279374; x=1793884174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xSmTw3rKUw=;
        b=QDCxeuR7n+EPW+zNdNkvP8WA1V49EribTYnN82IanQO7Lg9OCRCOzMrYTlrqIFnrgp
         Vekr0TrsTEr5GXl+FNFo2aY8Ly+bEmz54jEBas+cIGbx5AnB2Czz7YKBJ7dE6mbRpwl3
         hdpd/Qjaf2pkFh11jzmo1DUJw5JOqV1EfEn2M5VEWCqYBwk9+LZxWzXpGIJNrr5HXcvO
         6pVhQwTaPiFKO0i3ZAiL5GCqzuFBH8YLx/hdH8p/mMbyZ+u4/iFVj2pliJQwjOygFPDZ
         7jYQoQXw5VG7oKbNQegw/ZnFWu06EekLOXKEqlz2Eoh7wDQGbyzcb4RwTNZOFXX17yrd
         lAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279374; x=1793884174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xSmTw3rKUw=;
        b=QXrdwIQSRRVQYYcyh63ap8ocHw1Wd/U693oCeL1nCO0P4cl/QwlaWBLoj4hQnYXSLx
         yHLQB/z3s28CGRVRPX5aJcPy/z18kHq/PXL1sqUnf9SrGWIte+v9EoSLqyCicayvOHrw
         BTDo45cUjLFb79HhktdmXDFX5BKJ45D0eNN9pbglToQ9kYjK5YGTwuzLKOIhYjsIRJwl
         CgJTXJ5FsozYT1D8q08GcntPpfVTYzZXqFrw2nrS/MPSDyh6dcDiV+gi3F/G3dS60vqN
         nWeFi+NaFz2C1sM+cw/UQBjYJDyMan2hdxJseRefMC0uF+ebWPJJByFSsHm6eQUG0V6g
         rGrA==
X-Forwarded-Encrypted: i=1; AKwUvBzSiqia7OQaIPAGxkNJjEftiOwH5fYVNwIwmTOyFvblwaClrUgwDsDsgki2kxr7KsG+VWyEBmy03V88dgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+fwLwdCrHxv9gL5QRmvhcyUOmiCxyXasL2WX4bPlmmClSnUgI
	ccErH2cRq+6Ipl8VQr8Nv2MrAZSEM2tjIoAj34u7I1nI9sehTmwuNwqUiyoJsr0QlavPmkszePY
	hKyiKP1CZhsGlxGjHARppO3G4YaOpPTrq6TaiI+aKAaYgSwn56uzVxZzZe5eIzm4orkI=
X-Gm-Gg: AYBFou33CsIREuFUkQREOO05rgRyi79y2+V6ySP+ILBwBoEPHMKTsAeUd93Ob7eB73G
	SQi8LTM1MI9DKP4+HjtLFxaYiebRzG6CBAlKagznCAX//IRB/D5vy54KlUkiEPszck9o/aGqys3
	acTvWqA41GdMBuaK+di2eTWv4MvEPVvw1jnBj7DP5GKu5j7fsi7yBEYwYK1HztBY6N7GxlBLFaT
	fak7mjdEDz0fQzYTtQwjtMRtsYcXKs1z9sCNdBZ5uxLLjalrt35OixNOkP+cQKnI40FTSryvl/9
	vV1/NZ7XOyWPZCTa72dgmfnyVno7hh4EcdYRNktubhA9wxhjmUN050CTZkin+0gQv4D/q7hJqgO
	xX7lXu9LVNqWp6xSTEk46KFBiWbQnKotf3p0wVtkBrMxgcY0HJxx7TX1qzYetIuiyshDqHhLFVt
	D3Wy+PqTYQxrT5yZl0spTvUvG5fnJ9j9xPoigkedvu5HDKbzAosUEqDXxFkid3r45dvbU5bjOXZ
	w==
X-Received: by 2002:a17:90b:1b0f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae580cb98emr4155965a91.21.1793279374193;
        Thu, 29 Oct 2026 06:09:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae580cb98emr4155945a91.21.1793279373686;
        Thu, 29 Oct 2026 06:09:33 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:33 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/4] RISC-V Sspesa: Linux perf precise sample attribution
Date: Thu, 29 Oct 2026 18:39:09 +0530
Message-ID: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX+KbZ78tFSpwQ
 pULOSK9wnXqFXdX++NDphJxdaqMWLrjo1l02L9F0KBlPxKqlrJNn570ZmyAgLMTqdwsXrzRwtDn
 bLtBKC5+NUAd56yesHtAfCkJU0300upwlAGxc9OMGm/r+1YD93q9754i3Z/IBkm2YExge02+fTh
 eXPLMsPuyrOcUuDI/8XX/4qmM8fVT43oPLUXQX7wfeiA7I+J7wq64IMD1eHq4+I5e3lm+T1uwhl
 H5KBAeQwCAhhP7bw82xV1yJVBP2qiOZgSmRCfrRrttLsMpb6x3PJouuA1t4tAQX6oYRN2yNUUm6
 GjVHjU0xO1xrxsOhe/H+IBOkRWDm8H+/oOZEiJuYyu6lKLUkSAayGPejHAEzs19skmpVrYUd/nz
 kxEOdHUVH/I87VkEjbsQ5sW5gKcD3IiWc/AwoukJDVZ3ikeN2ZlIs6iFpIj3VSYaZnvc0BXd0cc
 Jime0IjKEWvK3wKXclA==
X-Proofpoint-ORIG-GUID: ilS0ohkOLWNvfwRRJbyl2BNzsPA0UTgA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX76FZjAdF6KR2
 IjEwDPDjakxI8SZa4efoK7z1mAlrWleJ0Th5fBZS1Ifs9snDjw5RypFCbs5ntkfsl0jugcqj9WE
 tzpUmNWv5Cpl/V4YOYqyoM3av/Nk0NQ=
X-Proofpoint-GUID: ilS0ohkOLWNvfwRRJbyl2BNzsPA0UTgA
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae3458f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=JfrnYn6hAAAA:8 a=Wy0b4BpvcoJVJ11Qc2AA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051

This Linux series adds kernel support for the RISC-V Performance Event
Sampling extensions Sspesa (Precise Event Sample Attribution) and
Ssplcofi (Precise Local Counter Overflow Interrupt).

The first two patches add the DT binding and ISA-extension detection.
Sspesa depends on Sscofpmf, while Ssplcofi depends on Sspesa. The third
patch implements perf_arch_misc_flags callback for RISC-V. The last
patch uses Sspesa in the SBI PMU driver to build synthetic regs for the
perf framework and report exact-IP samples when Ssplcofi is available.

Note:

QEMU does not currently identify any event as supporting precise
attribution. The QEMU setup is intended to validate the end-to-end
Sspesa plumbing only. Similarly, the `pesa=1` raw-event format bit in
Linux is used to simulate an event that supports precise attribution.
Such events are expected to be defined in vendor/platform specific
JSON event files, but this series does not add such an event file
for the 'Virt' machine.

Reproducing the full setup:

Sspesa support requires Linux, QEMU and OpenSBI. The matching v2
branches are:

  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v2
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v2

OpenSBI must be built with the following fix so that PMU overflow
interrupts work correctly:

  https://lists.infradead.org/pipermail/opensbi/2026-October/010957.html

Build Linux and QEMU from the branches above, and build OpenSBI with
this fix applied. By default QEMU doesn't define a raw event that can be
mapped to programmable counters and hence a special test DTB is required
which includes the raw-event-to-counter mapping.

Build the test DTB:
  - qemu-system-riscv64 -machine virt,dumpdtb=/tmp/virt-sspesa.dtb \
    -cpu rv64,sspesa=true,ssplcofi=true,ssccfg=true,sscofpmf=true
  - dtc -I dtb -O dts -o /tmp/virt-sspesa.dts /tmp/virt-sspesa.dtb
  - Edit `/tmp/virt-sspesa.dts` and add the following property to the
    `/pmu` node:
    riscv,raw-event-to-mhpmcounters = <0x0 0x2 0x0 0xffffffffffff 0x7fff8>;
  - dtc -I dts -O dtb -o /tmp/virt-sspesa-test.dtb /tmp/virt-sspesa.dts

Boot Linux with the test DTB:
  - qemu-system-riscv64 -nographic -machine virt \
    -cpu rv64,sspesa=true,ssplcofi=true,ssccfg=true,sscofpmf=true \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
    -dtb /tmp/virt-sspesa-test.dtb

Once Linux boots, use the PESA event modifier with a precise request:

  - perf record -o /tmp/sspesa-perf.data -e 'cpu/event=2,pesa=1/ppp' <workload>
  - perf record -o /tmp/non-sspesa-perf.data -e 'cpu/event=2/' <workload>

Check the resulting data with:

  - perf report -D -i /tmp/sspesa-perf.data \
      | grep 'PERF_RECORD_SAMPLE' | head
  - perf report -D -i /tmp/non-sspesa-perf.data \
      | grep 'PERF_RECORD_SAMPLE' | head

Samples in sspesa-perf.data should have the PERF_RECORD_MISC_EXACT_IP
bit (0x4000) set in the misc field, while samples in non-sspesa-perf.data
should not have that bit set. This verifies plumbing only regardless of
whether QEMU supports precise attribution.

Changes since v1:
 - Use the new shpmsdata.PRIV field defined in the updated spec
   to reconstruct the regs for perf:
   https://github.com/riscv/riscv-performance-event-sampling/commit/3eff81a6161ffc7a74a57436132d0c15ab549e74
   Fallback to interrupted registers if precise attribution is not
   available.
 - Add the required extension dependencies: Sspesa requires Sscofpmf,
   and Ssplcofi requires Sspesa.
 - Add the perf_arch_misc_flags callback to update the EXACT_IP and mode
   in perf misc record.
 - Add the `pesa` raw-event format bit and validate precise_ip requests
   against the precision supported by each event.
 - Clear shpmsdata before clearing the pending overflow interrupt.
 - Use Sspesa in the SBI PMU driver only when Smcdeleg is available.

Mayuresh Chitale (4):
  dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
  riscv: Add detection for Sspesa and Ssplcofi extensions
  riscv: Add perf_arch_misc_flags callback
  perf/riscv: Use Sspesa for precise sample attribution

 .../devicetree/bindings/riscv/extensions.yaml |  26 +++
 arch/riscv/include/asm/csr.h                  |  12 ++
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/perf_event.h           |   8 +
 arch/riscv/kernel/cpufeature.c                |  21 +++
 arch/riscv/kernel/perf_callchain.c            |  15 ++
 drivers/perf/riscv_pmu_sbi.c                  | 150 +++++++++++++++++-
 7 files changed, 233 insertions(+), 1 deletion(-)

-- 
2.43.0

