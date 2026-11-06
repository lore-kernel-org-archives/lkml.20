Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991077;
	b=0VxLDOqT0nfodzVf2poudw/WQCfoVbI/JZdzDKnN7e/IMecmaYSE1o8xqey0GQHzmD/n
	 iU+ODN1JdEjMPT3Y1awr20X3weHaZ4jhIR5apBDdVLh2kXYFwq0JG6qsTz/u8C9kat1mO
	 LyTulKlQpiT7YLV9aKWnb2uB9eiOf71/eYQDrBamLekW0/NbkiGhxwmUM7uvdlOo89ZDi
	 avWN5XZcZT5v1fAkk59c2LZ0QnaXcL91DDxUPU6igTNVoWP33OL8RopL3FmIv21wK+yuN
	 MbLVPKS9C3l31goDuWUh5s8ie8a1waJOWI86ZRcppOWYh4uXcR4mY+3Uw69XwJ8xAmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991077;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=x7k6+irpFO+kuKSMRhYM/fUvtg+NGs0wJW0nzxfmETk=;
	b=hKAJpZXC9WnTOzVjpCok4Lu5HaS2BnpeYhNBd1scMIqjC2rdREdLdRUYMK0pWrGEg2Zr
	 9q79CNAEcU9azgNIf3HzK9A1pwfkN/N74nVhJstkH5kMfuO5+BGiLND359sdhJqbvghJh
	 BfGOCc+jaXl3qiXiFvsnxtluYf5DuIhCPNaNSIAhKsf8G6/xaPYrulLxuGuZ8/eCnKdxT
	 yMd6gDb7jAJOwk8A3hgsN/xTyLSFFCb0JugWzZtN/pAFqumzGMC9EupdDYEq9jdxNfSKa
	 5tyZdjTB3hcPIkAl2Sx26ikjw3aJJvy88xQrQxCQaUFUYOZEuMbr8zobnF18KCOgUrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e42SqN0R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DD606A326;
	Fri,  6 Nov 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e42SqN0R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CB71F0089F;
	Fri,  6 Nov 2026 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991076;
	bh=x7k6+irpFO+kuKSMRhYM/fUvtg+NGs0wJW0nzxfmETk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e42SqN0Rnw8QzZ9vOKRbLsR3sY5kOxAccXrVxgmgl0kBZhx5zOkdFL6HM4xDozJ9r
	 K87JrYBqmhJv5CDolQNq5aunZwkV4QVixTJaaGLrRebeKDorM9TuPVjMEK4kwaTV/A
	 +F0QUc0WZ36CUJkdD463VI02bw3ao6dnq2WQpyx+sogv9jmqGw25T0ZMRnhjauVYZm
	 YZUtazo7cJ2DFVek+TwOLlrbWeP95e/o1nPZWQ3pbVeV6CNrQ4j6476XxgGiWQ8xyH
	 q2G220UrPL5y40HBa6sqDHerln57smZrMpZ+lpEJad7bxEHnzd/05W40OQt4BTo4LU
	 kxq3DMX5gn2Eg==
Date: Fri, 6 Nov 2026 12:51:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	gjorgji.rosikopulos@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
	jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy
 providers for SA8775P, QCS8300 and SC7280
Message-ID: <au4hdnq9rjM6RKG3@zenbook>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
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
In-Reply-To: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>

On Thu, Nov 05, 2026 at 07:02:09PM -0800, Anusha Arun Nandi wrote:
> This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
> PHY driver on the three platforms whose compatibles/soc_cfg were added
> by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P,
> QCS8300 and SC7280".
> 
> Each CSIPHY is exposed as a standalone generic-PHY provider node at
> its existing register address, with its own OF graph (port@0
> sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
> picks the non-legacy path once a board wires a sensor through one of
> them. The camss node's own reg-names/clocks/interrupts for the
> CSIPHYs are left unchanged, so boards that don't use a provider still
> fall back to the legacy in-driver CSIPHY handling. All provider nodes
> are added disabled by default; a board or camera overlay enables the
> one(s) it actually uses.
> 
> The three patches are otherwise independent and split one-per-SoC
> since each touches a different dtsi file:
> 
>  - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
>    qcom,sa8775p-csi2-phy nodes.
> 
>  - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
>    qcom,qcs8300-csi2-phy nodes.
> 
>  - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
>    qcom,sc7280-csi2-phy nodes.
> 
> This series depends on the compatible strings and soc_cfg entries
> introduced by the driver series referenced below and should be applied
> on top of it.
> 
> Depends-on: https://lore.kernel.org/all/20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com/

Since patch 1 was dropped, I'm dropping this series from my queue.

Thanks,
Bjorn

> Depends-on: https://lore.kernel.org/all/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/
> 
> Changes in v3:
> - Patch 1 (lemans): moved csiphy_opp_table out of the soc@0 simple-bus
>   to the root node (a simple-bus's direct children need reg/ranges,
>   which an OPP table has neither of), dropped the opp-300000000 entry
>   (SA8775P's camcc only defines a 400 MHz rate for this clock, so it
>   was unreachable), and reordered csiphy0..3 after camss so soc@0's
>   children stay sorted by ascending unit address.
> - Patch 2 (monaco): same csiphy_opp_table root-node move, and dropped
>   both the opp-300000000 entry and the extra "csiphy_rx" clock from
>   csiphy0..2 (QCS8300 binds through the sa8775p soc_cfg, which only
>   declares two clocks, "core"/"timer", for this PHY).
> - Patch 3 (kodiak): same csiphy_opp_table root-node move; its
>   opp-300000000 and opp-400000000 entries are both kept, since
>   SC7280's camcc genuinely supports both rates for this clock.
> 
> Link: https://lore.kernel.org/all/20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com/
> 
> Changes in v2:
> - Patch 1 (lemans): dropped the extra "csiphy_rx" clock from
>   csiphy0..3 (3 clocks -> 2: "core", "timer"), matching the driver's
>   sa8775p soc_cfg, which only declares two clocks for this SoC family.
> - The "undocumented compatible" and "camss_detect_legacy_phy() does
>   not exist" comments on all three patches were resolved by the
>   companion phy-driver/binding series and CAMSS work landing, not by
>   a change to these dtsi patches themselves.
> - Patches 2 (monaco) and 3 (kodiak) are otherwise unchanged from v1.
> 
> Link: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
> 
> Anusha Arun Nandi (3):
>   arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
>   arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
>   arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
> 
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 136 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 104 ++++++++++++++++
>  3 files changed, 412 insertions(+)
> 
> Best regards,
> -- 
> Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> -- 
> 2.34.1
> 
