Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889044;
	b=3vll9Gd8FXdPAOmh6oeNKA+L11/V7tgq/H8R9AzGGCCN8sKk0Wfo1QT2TH/1XH927wUR
	 2n13J3v//AK5etJKGYQW7KGEa7nFNgyNpcY1e5BtOW3vH9AGhSmmPHhccK/hXGeIpmg5X
	 EgMb8BzegTI78S+81y22pR7oGQxg1q+OwX+qHYbh0a9+qqqh7sM2BE+G4J/9eNFI7OreC
	 raY/hPMnozF15k6PfsWTnhEhMQUWvzV0hB9Ek628e7FJNhswunLEaXqIWzPanXIW7G/o/
	 vQEeITo85Q3YYtbL1OiaMYM8FDx+1Sps1or3peEoqwv+HP08pgOBza332J9B+eQuO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889044;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OBSo/4IN7S6trP7CgPBOd4llSonUbNqkrJxw7CQiCqA=;
	b=NIZaC7B1GZjlElqYTayMG6I3QZnxZGxRjQozxZtDxj+9Del97SYEd2vyibPf7H9lPziI
	 aIPfbhbDw4c1MFIvZlgfEWWYhUOnPP00SVbpeXVAjWUN+O63SrWT2YlGGgVD04umyuq8U
	 +KKznzPpi7B0+jpoCEyZd9YL7OVmufirbJPV6y1BpGzZwiPA1jglpbzX5f2TnAikyWryk
	 P/XO0WrAIerc0plG4a/TXw0XW/DYAS7QZSATU5lvXBcl+nFRA+1erklPdCfN3STrQ0lAJ
	 pbDE/vSWwA0YFYgBeD8QRfMJWI16VueZL2/q8EPdS2WBuXW7z8RlRgoS7qnD3V97aQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=wqSPP4SN;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E424606A31C;
	Tue, 17 Nov 2026 04:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E424606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=wqSPP4SN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=OBSo/4IN7S6trP7CgPBOd
	4llSonUbNqkrJxw7CQiCqA=; b=wqSPP4SNDPs9mlVJhVqodlTTM8hCkkL9ov8+3
	EuWJ/U4hWyJfNTMieF64k1+L9CI/7g1H+EYsCj7jLh170O8nxj3eHaGU+pa4KE16
	gFWSsRpFxTiHKK1vc+ekuQdLqUJJ/50c/ucrEEkBKsFZ3pfoCf/w88lX09tub+m0
	7LcH/Q=
Received: from [127.0.1.1] (unknown [114.214.186.145])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHATZH1ftqQgjLAA--.1640S2;
	Tue, 17 Nov 2026 12:17:11 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Subject:
 Re: [PATCH v5 0/3] drm/msm/mdss: reset all block resets described in DT
Date: Tue, 17 Nov 2026 12:17:11 +0800
Message-ID: <179488903160.260870.8168848839719897744@mail.ustc.edu.cn>
In-Reply-To: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgCHATZH1ftqQgjLAA--.1640S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr15KF4rtF18AFWkuw4fuFg_yoWrtr43pF
	ZrKwsxKr1kGry0kFn7Aw4jva4I9wsYkFZ8GF15tryYvan8Kw18Ar93Kw1Fq3429Fs7Xa4j
	va4jgw18CFWvqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xS
	Y4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUgR
	pPUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2r7WdojVwACs9

Hi all,

3/3 says "5 of 9 cold PORs became 15 out of 15" and leaves it at that.  That
is the only place the Q28 evidence has ever appeared upstream, and it does not
let anyone judge it.  Here is the underlying data and, more importantly, the
boundary of what it does and does not show.  No code change in this message;
take it as material for the commit message if you think it belongs there.

Board: Lenovo Y700 Gen4 (TB322FC), SM8750P, bonded dual-DSI panel
"csot,pp8807hb1-1" (driver novatek,nt36536), 1904x3040, DSC, two DSI hosts.

1. What actually fails, and how it is classified

The failure is a cold boot (real power-on reset) that brings up no image.  It
is ~50% of cold PORs, it is random per boot, and it clusters in time; it is
independent of the kernel image - the same binary is good and then bad in
neighbouring boots, and seven different kernel variants were tested against
this.  Three distinguishable forms:

  A. cardN exists, panel init fails.  Five dmesg lines, in order:
       command DMA timeout: status=0x2200200
       peer command DMA timeout: status=0x2200200
       bonded command DMA failed: master=-110 peer=-110
       sending dcs data ff 20 failed: -110
       Failed to initialize panel: -5
     followed by intf1/ctl 1 reset failure -22 and a vblank/frame-done storm.
  B. no DRM card at all, with "DSI PLL(0) lock failed, status=0x00000000" at
     about 0.86 s and a failed device link for panel@0.
  C. dark panel with everything in the DRM state looking healthy: connector
     connected, DPMS On, frame counter advancing, backlight non-zero, and the
     DSI pclk held.  This one is the reason "no DMA timeout in dmesg" must not
     be read as "display works".

The only physical discriminator we found for C is the DSI interrupt counter:
41 on a lit panel, 0 on a dark one, with identical DRM state.

2. Why "reset the MDSS blocks" was picked

Because in a bad boot the failure is not inside the DSI controller and a DSI
host reset does not clear it.  Registers read from a live bad boot:
STATUS0 = 0x20003 (engine and DMA busy), DSI interrupt count 0, PLL unlocked
bit not set (the PLL is locked), and CLK_STATUS sitting at 0x1743/0x3743 with
DYN_PCLK_ACTIVE never released, where a healthy boot shows 0x343 -> 0x743 ->
0x343 around each command.  Repeated retries after that point fail with
identical values, which is why a single bad boot costs the whole session.

Against that, the change under review makes the display driver de-assert the
MDSS block resets described in DT before anything is programmed, which puts
the whole MDSS block into a known state before the first DCS command.

3. The measurements

Campaign of 23 real power-on resets, arms sampled alternately in the same
session, identical kernel/config/ramdisk/dtb/cmdline except for the change:

  base (no reset)                 9 boots: 4 good, 5 storm
  base + MDSS block reset         5 boots: 5 good
  base + block reset + DIGTOP    10 boots: 10 good
  base + DIGTOP only              4 boots: 1 good, 3 storm

Fisher exact, two-sided: block-reset+DIGTOP vs base p = 0.011; DIGTOP alone
vs base p = 1.0 (no effect); the two arms containing the block reset merged,
15/15 vs 4/9, p = 0.003.  So the block reset is the thing that does something;
the DIGTOP/PLL-lock tweak does not, on its own, at all.

Moving the same reset out of the clock driver's probe into the display driver
(the shape of this series) then measured 5/5 good cold PORs.

4. Two boundaries I do not want to paper over

- The 15/15 figure is a merged group and it predates this series' shape.  It
  measures "MDSS block resets are de-asserted by the display side early", not
  literally patch 2/3 of v5.
- The reset set that was measured on hardware is the three-entry set (core,
  core_int2, rscc).  After sashiko's remark about 0xa000 v4/v5 dropped to two
  entries, and the two-entry set has not been through a cold-boot sample yet,
  nor has 0xa000 been varied on its own.  A paired cold-boot run of two-entry
  vs three-entry is queued; until it completes, 3/3 stays worded as "not
  repeated with this exact set" rather than as equivalent.

5. What I would like to know

Is this evidence useful for merging the series, or would you rather see it
condensed into 2/3's commit message?  And separately: given that the failure
is a cold-boot race that upstream cannot reproduce on any other board we know
of, is a quirk-style "reset everything described in DT" acceptable here on its
own merits, or does it need to be tied to a named hardware erratum to be
mergeable?

AI-assistance disclosure: this message was drafted with an LLM coding
assistant; the author verified every number and register value above against
his own logs and test records and takes responsibility for it.

Thanks,
Qianhui

