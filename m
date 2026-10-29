Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269031;
	b=iJ2EUUDCvE0OWn6GMyKXOwWoOmgerAiyT5MufcABewI+Hle7nSmOZgFi4+oKkqlnUeLn
	 SPfxaJOO7GN2rNXDvSWth+len6/+aIn+MmYy3q8fOByqyApm+bOBHtS84/0J89sWwDVzc
	 6VBr50U8P6ABKhfM7tfrKt56Vgzpni/G1ZIF7MOfrNzJAjitK4E+ZDPKN0BDn6HC74f3V
	 5bEbgzGv0zRC4xz/zGomgE939NPdeaqKF25kCtYgjRfRzNNqlNyFuaAEjM+5dGYsnskO8
	 kLyNMnREhwtPqnpGpuoFOGbb9Fr9zddwNefFDhW2hvXFD8b/B1IuyHiVwlJ7a+1MpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NPJOQiFiu3cThGScjhj4fYF5jTtoYIR+DKw+l+wDclM=;
	b=WrVLigyu3d/FUrgqgS0H202QpCMLUiWikBUIzIqlO1xbH1jgRUq7QzM1cazwQ5ADxNHn
	 33/Z7XgfK9JlOhbT/SUv90ysr4gserb/SvobMLu1P0+7RIj2C30wEDXWdDp7+sDYs7lNM
	 mkSPwSSXBmDTpDz1qAXXn7QA0L5qrldyha1molt6BnaGDD95p3ft17Xsg8dRv0a3+bseo
	 eBv2h9brWZZx3i/e/d7rsTcaY1/7vphMyewrmtYfw9PqFqdXY1ixqq9srt0yZSMu1ptQM
	 sykKKeH7hNu39IdTlxA8HM0gyL9rwsZZCyL0/l4yPtQgj0br43WF18K17T8ib0PZPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OtWUEuXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bkDMT/to";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEA1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OtWUEuXK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkDMT/to
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vSC42273523
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NPJOQiFiu3cThGScjhj4fYF5
	jTtoYIR+DKw+l+wDclM=; b=OtWUEuXK14AirTJL6g0ACsDKPbUPrUVDua1UpXeT
	eJ/V0kjzN3G+XtlM3FMndhpkXzYyBGu0c57CFSbdUsPxNkG5gP+DOa1cZ4ShrFrJ
	gOxoPiWTydpTQgdm8dswDl7ur9Y7OY5+gRWWuOBzQSs4N9MEJca7JjIpVLL7tY30
	oWa5ZxA7Wg8whUa9IgiOdPKYr4HonzHgH4WPQDU0SpW7xc6UIUWss2l7/XPfgTqK
	BSNu1XXeUdlJxicBW5lvO0ut3WJ4HusVQ02Mbe0yh3AiBK9F2sRd8eeT8jBOprYd
	pQp/vGSunUBTvb5ceHJwedGMyeAZePIpTyHJAzvTSlSWkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0b5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:17:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so346768785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269029; x=1793873829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NPJOQiFiu3cThGScjhj4fYF5jTtoYIR+DKw+l+wDclM=;
        b=bkDMT/to1VCqa6nNESVvlcZqigyjuuIkjEnasdRqCPYm4Ls1WlXMPR3DwFsuus1aq0
         OvLFrUFFgPGDwyTQySUY8KoXy2W8tBOHv+r337kT5cIxTAqf+RDlu1yZMWyC8s1T4QUO
         /9KXvd/QxDWpY5RGAmgg+Paj0yXt2xup7FEAZK+yVim/3sAjVoTD4onvUimhckZM0RAe
         0KR1aD3QYBRiABtUp9h/5vBlNXR04xPtbDVyCtcPN7eGMYX38j3TqliozEGAHrfMC0jf
         l1gJ7jqUJdL45PX70EWPch7+sdd8ga0zDlynxTI4+4ohLQCNV/3m114MPLFAnhlbvLQy
         /3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269029; x=1793873829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPJOQiFiu3cThGScjhj4fYF5jTtoYIR+DKw+l+wDclM=;
        b=ftM+xSv1Uw0n4X+Q/X5mWAdfAGpRY1hg5yGteJg2Id4fkbfg1Tzh+PGYQcAWKbn7om
         6un5v+3vZJSFxhQzo1pf56mFlA/8QYMgr6t4jQTx6f8FRPnRUitT5S60W9jm3cR33MS9
         ij0E7xNptWlsGmdGjvpJpHDqNdJlgXxMabDezU79cDHDp6qioLa4F9fEAqs3NJHLzFl2
         uDLSD/dT3fdHsjCEDZgGwa1FzLW+VhvKXTagEhj3M9YXvZAIo04RbJg1Hdricw3NoPvF
         aNXCx9+1B2paJGtxR27tO2pk9xlKOkIkxVXBi8lZjpyLo3toqq/zsnbIwgOXsVlAOped
         VQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQLMkgO0JYWx199RZ1pbR8JStmMmgpOg83XOHoaNNj7Em7MuUcCk8L9+GVC11145ZP04+khqZv31EIjqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyqWF45jtR8ncPWmUKwws7lvqQD4e9LrzZzacu34JXCnX++HFU
	1qwblU0uEa4Yd4lD1IjMz3hfPlisvaq8V03SI7m8xarYpTc8AWKRWjUU2Dc4Nmk1jN009oQoPYy
	HeFCh0x4jLD5/SIgqeGGVFvIAhalEvH+Uoqq35h/rIc75VvkGD72HZjs43bS1TGwcMaWzqWf9Rr
	w=
X-Gm-Gg: AYBFou3je99aOK3QHgpqDeCfbU77LaSsA9pMM6TtHDirUqv5uMOMzwj8zsA29D8YEY0
	fth0/cwaTsENHDqzvA5FDWn4ye6IaSkiajQOJp4h+y0x5qKqB2l/2KqZkuQNEaoXFqPb2dR8Drf
	SNASjfcyPt5J/+Y79w8d0PENNKLdMT/hS3Df59+a74E/mLn7gCOuEXIPwcaOSco/zzNkqO1Xy6x
	nTNXMfTrSjx9A8vPONgiso4Eeepn8zXV7lfQsrcV0tQZ7LUpNaiy7EcuEmANTiUN02iyqTtv4jc
	LcsgSNkqo0GE7IuegZfJ1Q6HG7iSWVrENbUFlMnjCTsRikT0k9y1Xq5gGOUYk19Dw0FfKJZ8ElE
	i7WRirXTxbh2wpEwBRSoDyGsDS0IzwQKpN2M2zcA2Qfncckp2QMwfYNscdaqMgKIi
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr698883285a.60.1793269029163;
        Thu, 29 Oct 2026 03:17:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr698880385a.60.1793269028525;
        Thu, 29 Oct 2026 03:17:08 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm56444675e9.1.2026.10.29.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:17:07 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:17:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: sboyd@kernel.org, jwylder@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] spmi: core: Add generic DebugFS interface for bus
 inspection
Message-ID: <53ths7dovupnmj6tcraiigwu3wfu4vlfza2rh43l4pksr3mwsb@u33x5uoxuig3>
References: <20261019202107.888262-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019202107.888262-1-vamshigajjela@google.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzOSBTYWx0ZWRfX1FJq80IoTfDn
 fG7cZhibBLq3w19ErwN0dfbSaFUHO4grQfXdv6tvueK4FwaNiludiMK+GOqWkSjSKnME+eUegPe
 MKYJpDXEEFhlvkbs+Ab9nk233A29PBA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzOSBTYWx0ZWRfXxx2vhHnfo0Bw
 IVORTf3Mk5pTB+HIZuzSqhCtM7JSg5nrSYN6Pqdua3z4PZCxrtENsXU4z3mP0loyYPaKggiPEZ8
 FTy7UKn5noPB7zPV4+J4syIB2O8j6n8EQefUwajhqJVczBc9nJM/uaKn1nam7uShCpEO+/T5unC
 sVdrGzLLu70dZv7F2fCbIcC2LahOL/ZbDS9IdoE2enHeUF9s6Wwtnkv7qB7WHUHLDtYBQZRckNo
 JsPcl30BtI7tMDz7dHTj9DiB+Kc41ob4Wzc3Vx6VT3htQ2rlAqeqFr1qokU/inf0sjAgSGI4ay1
 n/I8pnDKGn9jKqsvqHX91tL9k7LYEDnSCKpuToq3LS/i+HezZ198rEFhBojFim0N8aAYFDjDjiK
 Hzd3r3CS5hQQgq9mvCN+dlcRM5F6skPILtlT7j8X2eLdFyniWzaL0TUTqlE/NkgLGGMrmkh5RlQ
 iZ72wPOurvEXOYi6POQ==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae31d26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1XWaLZrsAAAA:8 a=tlVbMLCJcZbeR7vuVLMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Vm8KlOCgSiYv5lotJXf0p6DGaGNZZmN6
X-Proofpoint-ORIG-GUID: Vm8KlOCgSiYv5lotJXf0p6DGaGNZZmN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290039

On 26-10-20 01:51:07, vamshi gajjela wrote:
> Introduce a generic, controller-agnostic DebugFS interface in the SPMI
> core under /sys/kernel/debug/spmi/spmi-<nr>/:
> - name: Displays the controller parent device name and OF node.
> - detect: Probes the bus for active slave IDs (0x0 to 0xF).
> - xfer: Transactional interface supporting register reads, writes,
>   and directed command opcodes with automatic opcode selection.
> 
> Write and command operations restrict access to root (mode 0600) and
> mark the kernel tainted with TAINT_USER. Runtime PM is managed
> automatically across transactions.
> 
> Detailed interface syntax and parameters are documented in
> Documentation/ABI/testing/debugfs-spmi.
> 
> Co-developed-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: vamshi gajjela <vamshigajjela@google.com>
> ---
> Changes in v3:
> - Move internal SPMI core command helpers (spmi_cmd(), spmi_read_cmd(),
>   spmi_write_cmd()) and DebugFS prototypes out of the public
>   include/linux/spmi.h header into a local drivers/spmi/spmi-internal.h
>   header.

This doesn't apply on top of the current spmi tree or -next anymore.
Please rebase.

Also, please split the spmi.c -> spmi-core.c rename into a separate
preparatory patch.

> 
> Changes in v2:
> - Rename spmi.c to spmi-core.c and link spmi-debugfs.o into the composite
>   spmi.o module so CONFIG_SPMI=m builds cleanly with CONFIG_DEBUG_FS=y.
> - Route DebugFS bus operations through spmi_read_cmd(), spmi_write_cmd(),
>   and spmi_cmd() instead of calling controller callbacks directly,
>   preserving SPMI tracepoints and core validation.
> - Allocate a per-open-file struct spmi_xfer_ctx in open() instead of
>   sharing a controller-wide buffer, avoiding races across concurrent file
>   descriptors, and store struct dentry *debugfs directly on
>   struct spmi_controller.
> - Reset *ppos = 0 on register read commands so repeated transactions on
>   the same open file descriptor work without manual seeking.
> - Restrict SPMI_CMD_ZERO_WRITE at address 0x00 to 7-bit payloads
>   (data[0] <= 0x7f) per the MIPI SPMI specification, falling back to
>   SPMI_CMD_WRITE for 8-bit values.
> - Parse register addresses with kstrtou16() so values above 0xffff are
>   rejected instead of silently truncated.
> - Update Documentation/ABI/testing/debugfs-spmi to document per-fd xfer
>   buffers and 7-bit Zero Write opcode selection.
> 
>  Documentation/ABI/testing/debugfs-spmi |  77 +++++
>  MAINTAINERS                            |   1 +
>  drivers/spmi/Makefile                  |   2 +
>  drivers/spmi/{spmi.c => spmi-core.c}   |  20 +-
>  drivers/spmi/spmi-debugfs.c            | 382 +++++++++++++++++++++++++
>  drivers/spmi/spmi-internal.h           |  28 ++
>  include/linux/spmi.h                   |   6 +
>  7 files changed, 510 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-spmi
>  rename drivers/spmi/{spmi.c => spmi-core.c} (97%)
>  create mode 100644 drivers/spmi/spmi-debugfs.c
>  create mode 100644 drivers/spmi/spmi-internal.h
> 
> diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
> new file mode 100644
> index 000000000000..ad0246a5306a
> --- /dev/null
> +++ b/Documentation/ABI/testing/debugfs-spmi
> @@ -0,0 +1,77 @@
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/name
> +Date:		September 2026
> +KernelVersion:	7.0

Update this, please.

> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Displays the SPMI controller parent device name and
> +		associated Device Tree node.
> +Users:		Debugging, hardware diagnostics
> +
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/detect
> +Date:		September 2026
> +KernelVersion:	7.0
> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Scans the SPMI bus for all 16 possible MIPI SPMI slave IDs
> +		(0x0 to 0xF) using standard register reads at offset 0x0.
> +		Active slaves are printed in two-digit hexadecimal notation
> +		in an i2cdetect-style grid, while unresponsive slaves are
> +		represented with "--".
> +Users:		Debugging, hardware diagnostics
> +
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/xfer
> +Date:		September 2026
> +KernelVersion:	7.0
> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Transactional interface for raw SPMI bus operations:

[...]

> +static int spmi_debugfs_detect_show(struct seq_file *s, void *data)
> +{
> +	struct spmi_controller *ctrl = s->private;
> +	struct device *parent = ctrl->dev.parent;
> +	int ret, sid;
> +	u8 dummy;
> +	bool rpm;
> +
> +	if (!ctrl->read_cmd)
> +		return -EOPNOTSUPP;
> +
> +	rpm = parent ? pm_runtime_enabled(parent) : false;
> +	if (rpm) {
> +		ret = pm_runtime_resume_and_get(parent);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/*
> +	 * MIPI SPMI defines a 4-bit Slave Identifier (SID), allowing a maximum
> +	 * of 16 slave devices (0x0 to 0xF) per bus. Format as a single-row grid.
> +	 */
> +	seq_puts(s, "     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f\n00: ");
> +	for (sid = 0; sid < SPMI_MAX_SLAVE_ID; sid++) {
> +		ret = spmi_read_cmd(ctrl, SPMI_CMD_READ, sid, 0x0, &dummy, 1);

On the Qualcomm PMIC arbiters, address 0x0 belongs to the peripheral 0,
which doesn't exists, so AFAICT this returns -ENODEV for every SID and
detect reports an empty bus even with PMICs present.

> +		if (ret == 0)
> +			seq_printf(s, "%02x ", sid);
> +		else
> +			seq_puts(s, "-- ");
> +	}
> +	seq_puts(s, "\n");
> +
> +	if (rpm) {
> +		pm_runtime_mark_last_busy(parent);
> +		pm_runtime_put_autosuspend(parent);
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(spmi_debugfs_detect);
> +

[...]

> +static ssize_t spmi_debugfs_xfer_write(struct file *file, const char __user *user_buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	struct spmi_xfer_ctx *ctx = file->private_data;
> +	struct spmi_controller *ctrl = ctx->ctrl;
> +	struct device *parent = ctrl->dev.parent;
> +	unsigned int cmd_opc, val;
> +	unsigned int sid, len;
> +	char *str, *tok;
> +	char kbuf[256];
> +	int ret = 0, i;
> +	u8 data[16];
> +	size_t off;
> +	u8 opcode;
> +	u16 addr;
> +	char type;
> +	bool rpm;
> +
> +	if (count == 0 || count >= sizeof(kbuf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(kbuf, user_buf, count))
> +		return -EFAULT;
> +	kbuf[count] = '\0';
> +
> +	str = strim(kbuf);
> +	type = tolower(*str);
> +	if (type != 'r' && type != 'w' && type != 'c')
> +		return -EINVAL;
> +	str = skip_spaces(str + 1);
> +
> +	tok = spmi_debugfs_next_tok(&str);
> +	if (!tok || kstrtouint(tok, 0, &sid) || sid >= SPMI_MAX_SLAVE_ID)
> +		return -EINVAL;
> +
> +	rpm = parent ? pm_runtime_enabled(parent) : false;
> +	if (rpm) {
> +		ret = pm_runtime_resume_and_get(parent);
> +		if (ret < 0)
> +			return ret;
> +	}

None of the SPMI controllers use runtime PM, and the regular client
path don't do this either. If a controller ever needs it, it should be
handled in the controller (or the core helpers), not only in debugfs.

So please drop it.

Also, pm_runtime_put_autosuspend() already marks last busy.

> +
> +	mutex_lock(&ctx->lock);
> +	ctx->xfer_len = 0;
> +
> +	if (type == 'r') {
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (!tok || kstrtou16(tok, 16, &addr)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		len = 1;
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (tok) {
> +			if (kstrtouint(tok, 0, &len) || len == 0 || len > sizeof(data)) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			if (spmi_debugfs_next_tok(&str)) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +		}
> +
> +		if (!ctrl->read_cmd) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +
> +		ret = spmi_calc_read_opcode(addr, len, &opcode);
> +		if (ret)
> +			goto out;
> +
> +		ret = spmi_read_cmd(ctrl, opcode, sid, addr, data, len);
> +		if (!ret) {
> +			off = scnprintf(ctx->xfer_buf, sizeof(ctx->xfer_buf),
> +					"0x%04x:", addr);
> +
> +			for (i = 0; i < len; i++)
> +				off += scnprintf(ctx->xfer_buf + off, sizeof(ctx->xfer_buf) - off,
> +						 " %02x", data[i]);
> +			off += scnprintf(ctx->xfer_buf + off, sizeof(ctx->xfer_buf) - off, "\n");
> +			ctx->xfer_len = off;
> +			*ppos = 0;
> +		}
> +	} else if (type == 'w') {
> +		tok = spmi_debugfs_next_tok(&str);
> +		if (!tok || kstrtou16(tok, 16, &addr)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		len = 0;
> +		while ((tok = spmi_debugfs_next_tok(&str)) != NULL) {
> +			if (len >= sizeof(data) || kstrtouint(tok, 16, &val) || val > 0xff) {
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			data[len++] = val;
> +		}
> +
> +		if (len == 0) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (!ctrl->write_cmd) {
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +
> +		ret = spmi_calc_write_opcode(addr, data, len, &opcode);
> +		if (ret)
> +			goto out;
> +
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +
> +		ret = spmi_write_cmd(ctrl, opcode, sid, addr, data, len);

Raw writes (and SHUTDOWN/RESET via 'c') to PMICs can easily damage the
hardware, and they bypass the drivers and thier regmap caches. regmap
already exposes these registers read-only via debugfs and keeps writes
behind a compile-time switch.
