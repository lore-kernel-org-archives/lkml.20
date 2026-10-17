Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C6348463
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211484; cv=none; b=SOyvDAb6o00OSrjvGQiiJeWfcPKFdKmuTdO/TKfelH5+NJfh9Ai+aFGEAWqUzSF39LbksdieuTquwKpD7QeiHloIpTm9pgMOiYmgDE2PWDlKmmeQuSQyNfyc7EXX5mjYuEkyNIrl1tNizFNse3pBxB71rP/2wxZS6UfoHcO6cOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211484; c=relaxed/simple;
	bh=V22Y4ew+cRPmUlQoI9T2LAHQmgrzHRL/dYS3qPtKhr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gi14hCaW3KoFBrc/CHHkJ8v3/PmzoTB/DUVDEKL84ztvpcm05eU7zNtA6B9o6VCnKfY3CJ3mrI/27VTV7qFCSVf1YIbEPhWduCI/aiJVhwB7YjRwryRKNj7MaNXBWhXz+sdqMZHliBGi0bic6tVKdn65kGODCnSbXgHIyAUF48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1uaE9c0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keIiPpNo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1uaE9c0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keIiPpNo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30wE32625434
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvkbzL8PAAKLjZT+h9nN9vQ8ojaeMfr0aAUam61AdN0=; b=A1uaE9c0J9VVgbIl
	Auz3XiKGk4zkFD2zgBVQGnmU5oLbj2zB5NAHLW0iXuRNmNqKE0u/kNn62pXndGtg
	tGnQ1vHCJDE/8aumOa6lse0CCxBaahW7ndUHclE0CH0WMbEnMmP+W+5N9Wn5UwZ/
	IzlSA/ZRUzuKYW06v2NvXFREDhZcU6EFrZIiJ0bfinZVAdZ9oNtNmFBbhLimxJ6k
	gbiGUWjf8t/MGy06OipZioWB31AICAO10MXdn03gkvoaVGrOsQWTLsbc4NxVK4/a
	Sbp5OFgigQdtjVAX/WHn3rnu4peTuXUqnuc4m6N6DKgBzF3gLBJfXzNisGXOZHyS
	AnpDvw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtcppk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:31:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso972901eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211481; x=1792816281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvkbzL8PAAKLjZT+h9nN9vQ8ojaeMfr0aAUam61AdN0=;
        b=keIiPpNomiu+DLnvTHwaizupHn6ASjJSB4OQ9uLYd9FLnCHc54fR49zlqrFrkTXztf
         4MwCt+BhBwLb3d8xdDWNl4k38dJ9mM5049pJ+56dCPBc1G0SZG5GeMeBigkg2CmAlcjn
         ekIjyZkwRZUp9WjpkKm3rgV4TZfWjDblYGvIFySqaUoiTXhaVsIw5uhJCkIvdci8OX1k
         98KGrSUJQgWjvr5CSXnnkiTvpu96iPSU88er8svVIpu9+HWRGpttMAPTTaJVYGm4+A8b
         kB0RE72vsk0AslZnkaknK9m8bDtN+Cdp4WO/m/fS4ZTfNiq8Tqw8ux6RLVuxzNK8DdQk
         Xb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211481; x=1792816281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvkbzL8PAAKLjZT+h9nN9vQ8ojaeMfr0aAUam61AdN0=;
        b=aCuP2Kr0QQquCEM00AsU/OLV8tFU5ZoVBVE+0mszcV6EasZzMgjJg8hHrKd+x+7sca
         CSeCGujq77YYWjosIIxoLVj0yOrsimmRBI3LjBFXhqcbK8No1ivPjSXskcg7bznAyCpL
         seSGzCRzYzcEj8H2e5AoGpJKSDkZJa07rHpBs1ipm9qos65rC0cCO31PFSwMgNcLf595
         vHc5ddV/Amx4iNmMqnk7tZQeKg9NcfAKl78kTatbnS+9OdPmHicqxi/peJUcuHF2e4jQ
         Q99LrmiGJMBLsjpmSbmVPojwE5IbqUu91zApVAVaf4X1l3ZDndNLxRZi7f+2/68/HQaF
         V5Mw==
X-Forwarded-Encrypted: i=1; AKwUvBz40lCOEX2XMya4OI8KzK8txBSYArsPjO9ghdGZxwnLyNOZXlNZHEnuJ6wi0Jy/CGChvAhv2SpALAjgi6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSf12zJlxoOdcINpfYp5HwI6/DqJxcvWXfg7MOQTrNhal503y/
	z7zPZKRJsogHyJ5Vo1VOtM/CM+/dAsgyi1UOgU3+kM2wK0j2e9rjGJBYVzKe1bZN9IKzgBIJnIr
	VnwdptahbxN+YHWXRDwg6k5RgeBLhEVj1eztPhCsN75Hip+Y0DxOU+ucZR+JTv/VLCtA=
X-Gm-Gg: AYBFou06oC3/Rj7O+TiRe2YTQ+pRShFrNfIc+jY+WMAMPHp3fB76mdoKkqJXiwyym4a
	2yiu3WPoR1JFS1YTTkJzIoLYNHo5n4V9apWTbEKBuMjzhAjQF+k+S1Nwv+wQFBxjGd7o515g3pS
	pfwemUwbOf88WsWw4VbCMCitzYT4RL94og03ccVcOFyILEo9gQM30KWMw7BQzxJ5dgvzMuW1P2G
	GN141CodM6YPyC4Ah7lhkK326Fkz+kUeOn982oCc4xnOCszrSqHhBaz+/aQmArw67EHfrqqALuz
	DzcX6S08xJzAE6xGRd+M/UKfNRzKrNoF5dS1d8BQ/6kiOQNT9rzk8BBNTbW0Ac733TtY94Y6POz
	fn2PDxQYUvgHZ0ISJj70PjoO8XAJKxR+tdU53
X-Received: by 2002:a05:7022:ea48:10b0:185:fd0c:4585 with SMTP id a92af1059eb24-185fd0c494bmr1044062c88.33.1792211481394;
        Fri, 16 Oct 2026 21:31:21 -0700 (PDT)
X-Received: by 2002:a05:7022:ea48:10b0:185:fd0c:4585 with SMTP id a92af1059eb24-185fd0c494bmr1044011c88.33.1792211480811;
        Fri, 16 Oct 2026 21:31:20 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm10673913c88.1.2026.10.16.21.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 21:31:19 -0700 (PDT)
Message-ID: <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 21:31:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNyBTYWx0ZWRfX9rvUgs73u2fd
 WU6hMxa4YZu2IxE5LtFX2oIiX3pfXzpPK/oDg+lkyJvAE0M4SkazcoHEzeynGz7PEkfaghB9nz9
 FF2zQgpUwHIvHtMoYcVxsAgBn9eUQ9sfnmB7FQmXMbZRNTVVdxri2OSOhNT6wXLpvMZsoR8lRXM
 dGGv9LnkrcJEZDZ0re49q21aZyc7RrLnhy0Gh6oGyzkz10FNfHuBTpGW/Z2HSDmt2mXWskNed4c
 W6qbuQiHQcAEnQl8k/g3CaZzHF/xz5ee2Qt8dQeBJkQ6gWYUiR/qcKHB2vf1uIe8H+mDSOZ358z
 tvweTpej9CrNqa+aRfZP66EC7o9BF5dyw3YnNmRTdKxuhKrjKqcv/zPJNCGkNSMXr4LuR1z+Qvq
 TqSFq756Xvt2NlwXYDCvU/JZnwA5+LC/gVO83KBQXi0ONjxC+HemjyNZH9e/tZTgJeoEoYcdlnn
 BDZVDcp6G2rf4RpPvZA==
X-Proofpoint-ORIG-GUID: TcvoCrf6AStvGltLKurd9NMUBX3bBnvV
X-Proofpoint-GUID: TcvoCrf6AStvGltLKurd9NMUBX3bBnvV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNyBTYWx0ZWRfX+V24UURS1367
 RtuMouBHn3cmdp1fqbvhPLsQY3y4Ur+ryY1Fp2VfwifA26nQ+oV7UQBNbWcM+FlLrXehz3kmQLO
 NoGg5ZzRN3Jo8GQEo0CY6RP2JMtrIRI=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2fa1a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-Dc8apNzkz31aRkkPHYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170017

Hi George,

We've been working on C-PHY enablement for the same qcom-mipi-csi2
driver (SA8775P/QCS8300/SC7280) and have already posted earlier versions
of our series trailing David's patches, ran into the same
file-organisation question this patch raises.
Link:
https://lore.kernel.org/all/20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com/

One structural difference worth syncing on: this patch adds the X1E80100
C-PHY register sequence and hw-ops directly into
phy-qcom-mipi-csi2-3ph-dphy.c, growing the existing D-PHY file. In our
series we split C-PHY hw-ops into a dedicated
phy-qcom-mipi-csi2-3ph-cphy.c (mirroring the existing -3ph-dphy.c
split), so:

1. The D-PHY file stays D-PHY-only and doesn't grow with every new C-PHY
SoC added later.
2. Adding a new SoC's C-PHY register table only touches the C-PHY file,
with no risk of an unrelated D-PHY regression in the same patch/file.
3. The two PHY-type code paths (register tables, lane/polarity handling,
settle-count calc) stay independently reviewable instead of interleaved
in one growing file.

Our series is here:
https://lore.kernel.org/all/20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com/
https://lore.kernel.org/all/20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com/
https://lore.kernel.org/all/20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com/

Happy to discuss further and compare both approaches.

Best Regards,
Anusha Arun Nandi

On 10/16/2026 7:56 AM, George Neacsu via B4 Relay wrote:
> Hi Bryan, Vinod, David,
> 
> The Snapdragon Surface Pro 11's front camera, an IMX681, is on CSIPHY2
> over one MIPI C-PHY trio. linux-next has the CSI2 PHY driver and the CAMSS
> PHY API path, and C-PHY is the piece still missing for this camera. This
> series adds the PHY side:
> 
> 1. PHY_MODE_MIPI_CPHY and C-PHY configuration options in the generic PHY
>    framework, because CAMSS had no way to ask the PHY for C-PHY;
> 2. C-PHY configuration helpers, the analogue of
>    phy_mipi_dphy_get_default_config_for_hsclk();
> 3. a rename of the D-PHY init sequence in qcom-mipi-csi2;
> 4. lane mask and lane polarity helpers in qcom-mipi-csi2, with no
>    functional change;
> 5. fsleep() for the init sequence delays, the same udelay() for the
>    current D-PHY sequence;
> 6. C-PHY in qcom-mipi-csi2, with the X1E80100 sequence taken from
>    Qualcomm's GPL-2.0 downstream header.
> 
> The series is on next-20261015 and applies there on its own. The two
> CAMSS patches that use it build on David's "media: camss: Add support
> for C-PHY configuration on Qualcomm platforms" v9, which is not in
> linux-next yet, so I will send them on top of David's series:
> https://lore.kernel.org/all/20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz/
> 
> Tested on the Surface Pro 11 (X1E80100), booting next-20261015 with this
> series, David's v9 and those two CAMSS patches on top, with CSI2 PHY
> nodes as in Bryan's x1e80100 camera DT v7, CAMSS in PHY API mode, and raw
> capture over RDI:
> - front IMX681 (Sergey's and Andre's v8 driver plus its C-PHY RFC) on
>   CSIPHY2, one C-PHY trio at 2.4 Gsym/s: 3844x2640 at 30 fps, and the
>   sensor's colour bars are byte-identical to the pattern captured with an
>   out-of-tree driver. The settle count is computed, 28 at a 400 MHz
>   timer;
> - rear OV13858 on CSIPHY1, four D-PHY lanes: 29.9 fps.
> On the earlier test setup, linux-next's CAMSS and CSI2 PHY as modules on
> 7.1.5, forcing any settle count from 6 to 48 gave the same frames.
> 
> Open question, from Nihal: the X1E table is Qualcomm's 2.5 Gsps one, and
> downstream picks C-PHY settings by symbol rate. I would keep a single
> table here and add selection by rate when a second rate is needed,
> unless you would rather have the structure now.
> 
> Thanks,
> George
> 
> ---
> Changes in v3:
> - Drop the RFC prefix (Bryan)
> - Test on a linux-next kernel instead of linux-next's modules on 7.1.5
>   (Bryan)
> - phy: u64 and u8 in struct phy_configure_opts_mipi_cphy and the
>   helpers (sashiko); pick up Reviewed-by tags from Loic and Bryan
> - qcom-mipi-csi2: split the lane mask and polarity helpers and the
>   fsleep() change out of the C-PHY patch, each with no functional change
>   for D-PHY
> - qcom-mipi-csi2: write the C-PHY per-trio register addresses with
>   CSIPHY_LN_CTRLn(); the object code is unchanged (David)
> - Link to v2: https://lore.kernel.org/r/20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com
> 
> Changes in v2:
> - Rebase on next-20261015, PHY patches only; the CAMSS patches follow
>   David's series (Bryan)
> - phy: rename lanes to trios (Loic), make symbol_rate unsigned long long
>   so 32-bit can hold rates above 4.29 Gsym/s, and keep Bryan's R-b for
>   that patch
> - phy: new patch with the C-PHY helpers (Bryan, Loic)
> - qcom-mipi-csi2: new patch renaming init_seq/lane_array_size to
>   dphy_init_seq/dphy_lane_array_size (Bryan)
> - qcom-mipi-csi2: rename the C-PHY table to lane_regs_v2_1_2_cphy and
>   shorten its comment (Konrad)
> - qcom-mipi-csi2: no separate bus_type; the endpoint sets phy_mode and
>   set_mode() checks against it (Nihal)
> - qcom-mipi-csi2: if/else instead of the ternaries, one declaration per
>   line, and lanes_enable() split into lane mask and polarity helpers
>   instead of the goto (Bryan, Nihal)
> - qcom-mipi-csi2: configure() uses the helpers and keeps the link
>   frequency, so clocks scale as for D-PHY
> - qcom-mipi-csi2: compute the C-PHY settle count instead of the fixed
>   table value; blank lines between the per-trio blocks; fsleep() for the
>   sequence delays (Nihal)
> - qcom-mipi-csi2: drop the video-interfaces.h include, no longer needed
> - Link to v1: https://lore.kernel.org/r/20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com
> 
> ---
> George Neacsu (6):
>       phy: Add MIPI C-PHY mode and configuration options
>       phy: Add MIPI C-PHY configuration helpers
>       phy: qcom-mipi-csi2: Rename the D-PHY init sequence
>       phy: qcom-mipi-csi2: Add lane mask and lane polarity helpers
>       phy: qcom-mipi-csi2: Use fsleep() for init sequence delays
>       phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
> 
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 228 ++++++++++++++++++---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  53 ++++-
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   6 +-
>  include/linux/phy/phy-mipi-cphy.h                  |  89 ++++++++
>  include/linux/phy/phy.h                            |   5 +
>  5 files changed, 348 insertions(+), 33 deletions(-)
> ---
> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
> change-id: 20261015-x1e-cphy-rfc-201860c8097f
> 
> Best regards,

