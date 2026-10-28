Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186689;
	b=Jq5zWdF9U1kw9DcamN1q0tlBfyDsfilwaZS9XjqIDNmyGs31CygavOCJSQvjG/xjUz9p
	 THwwhC4QUuR8ridQzkd9yZs0fzDeEhkVgOTbiFjmXzNKWQMaSgafwqmWcXN0guaYC60OM
	 RTEiPpNSgTB2hoH2PvThRBK8ho/zZCWV5gSEVCG7EaQOTdbvcDunhENXshkocOvtsqlJP
	 o8J0qSC20MjpHBt8/BCaix3FV/Fl7ae3f0Wy46uv0ngtBIqSYKG9VVAHXgl4Wr8ZMypcr
	 mfWcLmZJyDuY5obxqvkCVnJ2KVr+JjZllfl8Qulue/Loj8aw6h/rx0V7ybU6L01i0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186689;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=GQQcgpZJwrZw/LB/XgVmY61NkifszxIOymjocQEoxmg=;
	b=yDL7wiJLZQjRfL3YftGL/kfMi8EmITl611Y/5+07Tw23Batnl9WT08lLHF3CGhnRY0Xf
	 ecmg/HV2A55DV79l+FiDpM3ap7cJMWya42LBZOe9KqqLjtUKy4DQuz7N4a7O8Qp+W+9Ur
	 pFdGzReGR3+QpNmPi9+t+vBkMtl7gzKzRtxz3sn5bKwlx9CVhsJusBqChcbW9G7RQf2CI
	 rXN7PKjaZon6qJ/dFmLR/NPHIYGcSwVw/w/+vYOOHGyxPYQdBOn1WEARjPJOdMONE11Lz
	 A7aOwO8wVq+83y5qDOBghoWkGrMJUf00SxhEUOiKmm+n/YsUFBf9NOgQmSHeyPGBmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A21jxCc9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541AF606A31A;
	Wed, 28 Oct 2026 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A21jxCc9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E681F01825;
	Wed, 28 Oct 2026 11:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186688;
	bh=GQQcgpZJwrZw/LB/XgVmY61NkifszxIOymjocQEoxmg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=A21jxCc9sLaua+7v252kZU0tEG/QxrYQel1ipeb3evz+ffhYpVnL64zs5cKC+fMPK
	 nWM7+OWiYVsU5JHj44jV0ZnzUBE2oVmGaVDeoIR9HgO3uQX5trBfvfc13I5Pq0Opkr
	 uUxEPCT7nqh2Cr4lkieVNJvMklJNn5i2l7E+sKQAoOddtKgOim5EDHVTXsydDVL5D8
	 aSXsen0NFrcX6e2gTkXYSB+3YwbSJROOCbEbicNIxzdIK/4pSYs0FHmnHIpsQLcaeG
	 w30tG7eAqN40uLD1wEpws85o/yMFaAkC2kUs/KQPqSV5mNu/qBViuNf9P5DdgGJwWf
	 3Cac7YMVUXfQg==
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
From: Manivannan Sadhasivam <mani@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
In-Reply-To: <auBi722rs5BvaExx@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com> <asN4I1cpVb5HLNu7@parshuram>
 <asOMP3uJJmdpfvtt@inochi.infowork> <atS9fkULEWfCbVVm@debian>
 <auBi722rs5BvaExx@inochi.infowork>
Date: Wed, 28 Oct 2026 16:54:39 +0530
Message-Id: <179318667977.5872.17095079427326558812.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=mani@kernel.org;
 h=from:subject:message-id; bh=O8WpozuHvriuxt1s/rrpiM234RfLSzQCVXwXN9/aUiQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4dt6eqI44paevA1QxiozX4MYt/L9zGkzkZ3M7
 oqCxyeQqI+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHbegAKCRBVnxHm/pHO
 9bsTB/9LYbCYkGWRJiNpsmRbHJ+vYKT66zeLqkGy/SyKGlCu7lDkwu4xYMiF8Pck+lqmLxvXuHi
 P4lZUdP5QtvVi+j9V9GA5r1+44pvKSWx5/FqjFOkKZFb6Gy9LdEvb4IFLzq64E+wpui8kw0fhM/
 gHjDPyeKHFgURMBfMURVe2q0adgdFn5HPyPQEmpSi24QpibGq7jBX0IKJnG6pZdVLOA51omw2gx
 HTT56pRjnDhmGjKDFvZfYLJ7rAfchMJNl86IIk866QaLXxKCj56Z0u5fQSbrQ6q8KjNKBua5/HA
 RnxPCAJfH2E1WOXIYDuBdsv4u3fRqDXIchW1kwPuil3k5Qsj
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-27 16:41 +0800, Inochi Amaoto wrote:
> On Sun, Oct 18, 2026 at 06:09:49PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Oct 05, 2026 at 07:41:52PM +0800, Inochi Amaoto wrote:
> > > On Mon, Oct 05, 2026 at 12:12:51PM +0200, Vinod Koul wrote:
> > > > On 29-09-26, 16:52, Inochi Amaoto wrote:
> > > > > Add several helper functions that allow drivers to get several phy
> > > > > consumers in one operation. If any of the phy cannot be acquired then
> > > > > any phys that were got will be put before returning to the caller.
> > > > 
> > > > Do we have many such examples? Phy is not a many resource like
> > > > clock/regulators... Do we really need this. How many in kernel users
> > > > will benefit from this API?
> > > > 
> > > 
> > > 
> > > I guess the following driver may benefit from bulk api. Most of them
> > > are PCIe drivers....
> > > 
> > > drivers/ata/ahci_imx.c
> > > drivers/pci/controller/cadence/pcie-cadence.c
> > > drivers/pci/controller/dwc/pci-dra7xx.c
> > > drivers/pci/controller/dwc/pcie-tegra194.c
> > > drivers/pci/controller/pcie-rockchip.c
> > > drivers/pci/controller/dwc/pcie-qcom.c
> > > 
> > > Note: I mean the bulk api, not just the things I added. I guess many
> > > may want devm_phy_bulk_get() or devm_of_phy_bulk_get() instead of
> > > devm_phy_bulk_get_all().
> > > 
> > 
> > No. I don't think the PCIe host controllers need the PHY bulk APIs. Most of the
> > time they need to control each PHY independently in a multi-port setup. So
> > having the bulk API doesn't seem logical to me.
> > 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> 
> Sorry for missing this one. For multi-port setup, the answer is no. The bulk
> API is not a good choice. But for multi-lane setup of one port, I think the
> answer is yes, the driver can just control the phy together and do not need
> a loop for that. At least for pcie-rockchip.c, I think it is reasonable, its
> logic show it use multi-lane setup, so I think it is fine to port.
> 

Yeah, if there are multiple PHYs to be controlled within a single RP for lane
muxing, then bulk APIs do make sense.

- Mani

