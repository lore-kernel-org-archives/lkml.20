Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770467;
	b=TQO+YscYgRxKOOv1l0LvYigYMjShEpwLgbMaTPiS18FYZYQiovHdfxo+WpcbjgME15qE
	 LrUbhWxDWeZVDC31XXRkoslariA427nbsB/RO/UEJ8aLBB6z9DGjSxJMOkBDTuB9DW4y2
	 GHvvSEKkT7ozHcHh1+rLrRHweO0xKy3GIYuu8L4YNkEPDjKcu+JOmwEp76tt+NXrHWcDx
	 4wADvDISnuPvYzGcg04Cyvp3Dn+gPGmZqQ5LwHqjfjXFqtpTh0cBu9BU0JitxlcbuwU3R
	 dn8jbdkmANb9MXGFi+Px72tky0TylU0/PCHEG+fe3t5DYE5UtkwFPZDchKdhJKbpeew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770467;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U+51QAUSyzB+DcRMoMVMr+zf+XTPZAFIXU5itFRU/J8=;
	b=sFEMvOaXSs77ZM07jV7QMjmL2MQG/ZFMGLDpu7PAc/i9wZ1aRtSLZx4hxUG2hvJUeIZ8
	 Gb1Wx2BMxXvEFyRdfjN410Di1tBKDhj80GL/TQZcMhWyd5+/G9SRs6bl2Z1CiqEFFO4iF
	 L0f2RGOukUh0WDdOyphN7NtF/h1aTTLqD/dTy+t7s67YpbuuU9qzW1NzsQm+jv0B3idBp
	 bgBH+MggkI6UyvKlY5TjFPEairQO0mwFEUXAzByotPuIPNyu+DNHO5FuZS0dkFbbej3q/
	 Nj8UOjxQOyzPxG5ehtUZgOMExkBG+pP9oiLfP8EjixjZmTv2mf+rQwEzlnfxPYugoPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B838606A32C;
	Sun, 15 Nov 2026 19:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8555E1F000C4;
	Sun, 15 Nov 2026 19:21:03 +0000 (UTC)
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
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Hiren Gohel <hiren.gohel@oss.qualcomm.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <0032f652-4ba1-4a52-9241-635207f0caa1@oss.qualcomm.com>
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
 <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
 <0032f652-4ba1-4a52-9241-635207f0caa1@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 11:20:55 -0800
Message-Id: <179477045510.107393.16167606981222781332.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=CmDdC5yIx2xWLSRLzs1ukzwBn8nzVj0C0NkdH037HDk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+gYZimshdPDzOc4sRn6gnSD/oT3DoXrlvEjdO
 15rkiPgtheJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoGGQAKCRBVnxHm/pHO
 9eOEB/sHtI5U7bRC2uNbuJ7/GYjoeaJ8CAINi7Q6/Xt6MxNRMpbXi3g7+C7o+tlVxa6f94KyB8I
 Pny3DgHE91A9vhgrv8GTx1xw/OAZmJRc8PkHuERYkmHBJHKno/Us7XASR0jebuvIRj6/C3XfNGE
 gJDfAZi/Wxjp/7jCDT+THFGgKMMLOWL8IZd7QaAao77Mn2X2J0tsL7VhusXUcLyo83jjeY+2nK2
 bVedOn9DtCzb8qnUA7KPocb2eGo0PJWM8nprAMNgpS/Dr4Gy9U3R+ok+15ZrUK6JWCV2maucAVv
 2ha2fQK1Zy+LL5Qy0YeH8KYga2HZG313QGtoBMkvsVVBOx5+
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-27 12:00 +0100, Konrad Dybcio wrote:
> On 10/26/26 10:41 AM, Hiren Gohel wrote:
> > SA8797p platform abstracts resources such as resets, clocks and
> > regulators in firmware. The SCMI firmware exposes multiple protocols to
> > control such resources which are identified by protocol_id.
> > 
> > For this USB phy, 2 SCMI protocols are exposed by the firmware:
> > * power domain management protocol (protocol_id=0x11)
> > * performance domain management protocol (protocol_id=0x13)
> > 
> > The power domain has 2 indices: 'core' and 'transfer'.
> > * core controls the regulators, the clocks and the reset
> > * transfer only controls the clocks
> > 
> > For example, to power on/off the PHY, we should use the 'core' domain.
> > To disable data transfer and keeping power enabled, we should use the
> > 'transfer' domain.
> > 
> > Add a new binding for the Synopsys eusb2 High-Speed USB PHY
> > found in SA8797P.
> > 
> > Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> > for which we don't have any information.
> 
> How come we don't have any information for what the firmware
> that ""we"" wrote does?
> 

And it always puzzles me how each peripheral invents its own ABI for power
domains :/

- Mani

