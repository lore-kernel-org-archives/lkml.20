Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184683;
	b=qN3Ecgo/db8oRbtH1dxdrPvGXz09gLJRvXXsS1xq16aCjdQYTrpyU1g0W0oIko64P5mV
	 dQN664Xk5WccQ+dt3IGngF94fIOQW8iDKGLCbsswPSujdy1KfIyD37Dnjk4Wx9gYMfx+a
	 +lo3d8hBja3OK3ceVuaSaRueCbcl7ekVfRjarlOYm0MJbtHjo39vj0LpCr/ZLyznJbeSf
	 jIzOll+alo2UoLvkCLL2LwUwXmyDXrAOpEKEPJb6wYWdVOMs/fcCRb/rJtqTTbOwNNJiV
	 /KVVrVaxU8rrFEcIuSsduRSfR0SnvPeRFfQubeBmbHo7uepOdEKILFVD9pCDaR6+TXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184683;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=T3nRekxwRytEydRWLjRP5g6gCT4cSFJaD0Z0gNrpDHg=;
	b=p8SJlmYWXEA/LZv4vjljZnz375eN/CV0yjvxAenAGlhLcQRGuuMhEYRKmDY0dkEnFQFc
	 668wRkumY4idfYU+L5Db3FOIQ4d83Ln+6+2Zy3feqoOlUhu581srYLOYenfBYdL5Fv2DH
	 mCxc/X5ARs0bhm3wl1L1EQs5GF9mgqaiIv52jPBxGU0PKszh794n5iAFDNiCgZ3btWTus
	 lxHU1i26FEfBR15e9dIfWuvkQx0Hj97tiQdtjm2qG7ip18cdqFDSylhN/+9/y0rAGsmsO
	 y922VFuU9j9gH+jy+4uz0KPGv3IIesJ3524yTHOuHyyXvaqgGJ+A+4fNReHuWkiydrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGYZqcaI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B3606A31A;
	Wed, 28 Oct 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGYZqcaI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5271F01825;
	Wed, 28 Oct 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793184682;
	bh=T3nRekxwRytEydRWLjRP5g6gCT4cSFJaD0Z0gNrpDHg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XGYZqcaIK8xhS5PE6Y6FYIUgoM++v2dwnNHIBYcKxlGO4714/5d7eu1uRGUFXwfMY
	 e520e3J3MslbVEtDsHLjf165VPUuGyalxU6l5C588Bt4IG8bX/cyRVYYICIZs7qULJ
	 aHXAKC5N/7qDbPFTUx09GVGmH95iW+eqZgEU3uS8s5uLRembdXOaCiqEkFchkOnPAz
	 EdCwVQ3sKY6MCm+A3oqONmzkoVIH+4zlC3SJ2vTdjwgM6SudgmihgBhtPBNBEch04f
	 cYGV7AG7o7U7oKgRlPUIznF3DCs6SM6Tsqxqg7QL+Vf+ce4o9Xnji5xoCqQa7jJiLr
	 6evloN+AGV2ZQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/3] phy: qcom-qusb2: describe autoresume bit
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kathiravan T <quic_kathirav@quicinc.com>, Baruch Siach <baruch@tkos.co.il>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Manu Gautam <mgautam@codeaurora.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <67366b4e-21d8-4094-abff-b0539bae47c3@oss.qualcomm.com>
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
 <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
 <67366b4e-21d8-4094-abff-b0539bae47c3@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:21:09 +0530
Message-Id: <179318466919.5872.3084399469823329926.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=mani@kernel.org;
 h=from:subject:message-id; bh=7EL0+hpnNQk0OqDGz6aOvSt/kd5txw0p2t7OnssdevQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4dOgdj4iYrpWkk4qezNYCX3u6QoGqpdpnRqpA
 aPeVYt+/ECJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHToAAKCRBVnxHm/pHO
 9ROOB/0ckXiLX2nwRtdpqwrl+Ly326U7T6U6K9I3rfDePZvlRXdgCdsQgHHoMBnyCexY18vCxNF
 FULGI4pYaJ3/n9fr7xOwGSai6TVW7jtMCEoGJwFmXoEMbE+iQvM2eARjNcn8Y79/IzeMGUmMRr7
 Y8ZsDCLoDhFKBiUaW4naaJmPHyYuN5GAZP7C6RnlSuqnhqIJnFk2JfwlE8BQVLF0jLaQ6+dVTND
 VDaQBA48ORyo4DTKmIEXv7lXfbeJHPEMbXir5+6mWoPrnQVxpPHI/zo531SRjtuA4ycyuPv8UQj
 Mdy3mEZH8PkaV/BcCXkzGMn7Qej2DA3xEAhM4wFNtPEB8o+r
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-16 12:50 +0200, Konrad Dybcio wrote:
> On 9/20/26 3:59 PM, Dmitry Baryshkov wrote:
> > There is a confusion regarding the autoresume bit. Some verions of the
> > QUSB2 PHY have it in the TEST1 register, while on the others it is a
> > part of the TEST_CTRL register. When adding support for autoresume bit,
> > the code attempted to simplify the handling of those registers, putting
> > both registers to the TEST1 layout entry. In the end,
> > ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
> > (because platforms using that layout didn't use autoresume), while
> > msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
> > layout entry.
> > 
> > Update the platform data to specify the register to be used for
> > autoresume handling, define both TEST1 and TEST_CTRL registers and merge
> > ipq6018_regs_layout and msm8996_regs_layout which become identical
> > afterwards.
> > 
> > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> GPT has a concern:
> 
> [P2] Preserve Shikra's autoresume behavior
> 
> shikra_phy_cfg uses msm8996_regs_layout but doesn't set
> autoresume_disable. This adds TEST_CTRL[3] to the shared layout, so
> runtime suspend will now toggle it for Shikra whenever the PHY mode
> is valid. Previously, its unset autoresume_en was zero, making these
> writes no-ops. Unless enabling autoresume on Shikra is intentional
> and verified, preserve the old behavior by disabling it for this
> configuration.
>

Sashiko raised the same concern...
 
> but I think that's fine since we *want* autoresume?
> 

That should be fine, but this side effect should be mentioned in the commit
message.

- Mani

