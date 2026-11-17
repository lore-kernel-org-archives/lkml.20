Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920647;
	b=x9kQNxgFVSYnt3aTSt+7wx84dwOeDw75T1Dt9EI0kTf2+2lFFC702n49w0gLO8eor8xX
	 ccZsPmH2e2h4SOda+SfgbqihwPE9i0anXd2fEG1MgDwQSTN+SyRrYXp5btRNSgoPPsmEP
	 0nltgysjunkfH+G2XOX2qD3yuj/jrMCEHtFF48nsywV044Iwvtd4z/1S5c19Mcu5y+aWY
	 dxtp5vB2LrhHm5h0MluWts2sUwarAig3QjlKi2MCVFY6waqCBKffDEGlVem1d/wwNQDyn
	 Thlfvz+AXLNFCCqKxSxBkEkxCvH/O6VhMCvdBTDM6e/e+VVTe45CiY5EFIZ6t2Wqw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920647;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TWJ+aPspStvsIRnsuqDDjswtcq5aPRcs0lEoUatZyeU=;
	b=B2ySu9C0GT0gL6lU2dnatDSiuNMw0EnA/y48mWLcPmsK3qdS0B+X2AijKgNl90iarXD7
	 peEkJfI075mgD5LWfGkDlwDhELHWSPXGaUngIh8Rc8UKsqLzKuJKCflv+uINdpAdHGwqE
	 7EOglA60pKWpY+KE21zvONP0jogIR5NVuZhaVjTPbbqNnlKoGpZNF5ftTFaokcjKHWne0
	 /d+F1YD/i4qJvjYaCWAAkpgE06oHkKxDJJ4gEVJ8plRXscbWJTXImXt+1+Ig+PFBVPNpC
	 tBxg849odj8hgZyxscPcQE/TeOAfCTuES8t8A52yR8PFuw71Y7bJZHibVh0DY2TO6IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M64jXVsn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5154E606A32C;
	Tue, 17 Nov 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M64jXVsn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4260B1F000C4;
	Tue, 17 Nov 2026 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920646;
	bh=TWJ+aPspStvsIRnsuqDDjswtcq5aPRcs0lEoUatZyeU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=M64jXVsnznj9uM5oY+mu3lrUlPt77yaGGp9PqaEVaatX5+v/4IPfUrjfW34ijwvgP
	 2bJ+8q76T+bLZzcBNIFbiUTj9tHJWuFXC4RzU9T4JIy0X4HSQQrQQqhUHLchiBb+2y
	 g6JTJVf66zjbmMPd7zj62OYHGOgZ7YJUziGl21ltjK1jHiVi3Jxbm7evc/odTX2b5x
	 06dyTFPeDxWPyiqvZ78Ssp6MEZjNO0LHvlQhdNRps2Sffectc96fD/NpIbLfjzvmkX
	 J0stg3yHFE7W8l7O8nBStvVfEEpCngNzQpKGYfRTEYeZr9gqUy3stgm5haNVnw7BLx
	 exVccq0/4JlQA==
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
Subject: Re: [PATCH 0/5] media: iris: HFI gen2 features and fixes for
 VA-API
From: bod@kernel.org
To: sophon@radxa.com
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com, 
 Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>
In-Reply-To: <3B240D36F79259E9+d729c8d8-9eaa-4941-9516-401fec7970fb@radxa.com>
References: <2a2gB7bYZ9q2UTG-mF855lyJvWdn3Ba6jqrFTEVO1EAjAIXMh7_-65v4XlrZmljww-5ozkNYL2-lWKTIH4oqOw==@protonmail.internalid>
 <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <e0911e13-65d5-45df-9e31-7f99e5600a50@kernel.org>
 <6d16d639267c69344623f80ea91817308ef4f7d0.camel@ndufresne.ca>
 <3B240D36F79259E9+d729c8d8-9eaa-4941-9516-401fec7970fb@radxa.com>
Date: Tue, 17 Nov 2026 13:04:00 +0000
Message-Id: <179492064054.2846709.13243323816905529693.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760; i=bod@kernel.org;
 h=from:subject:message-id; bh=2d+EYUsgqKRjG77KbowxZKwCHSW7N+tPVUxCXme3YPs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/FDAn48PUni9w+lCl+rKZ49HM+olEGok5/O1q
 1lFXdppPKqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCavxQwAAKCRAicTuzoY3I
 OnOID/9q2ounCRIwtb2DMzOhTNlBRc9smouwQQJ1Em39lVqE1y375dotyfSdRIbXIlSPjeyx15Y
 3Y3I6ztCEzujkjC8OxIBAvGHfg8JeJ7LnsjGabwDBskaxSw2qLvlRpr6eQvnVPQtLI0oIYH9JUA
 uibrdE752dganidrN3axHivCYbkZvbxyAloxpRpEcGjye+lP7KH0gp/Czw5qm8WiAiHXG90L5K+
 e3YCWXYVCAvRGeRYKioJKmIeNs54fDggVDJn8lKYLf/CUmGON0O6AyJVyuvDk9l/kwVjaHPyH2W
 INyKafSQy6A80K9A/VaGOU4UKW/cbDBssOdjx0WV+sdUDhX7tl5Pvps9NIOJEsiSMoh0O9R/Nmw
 OAcCoraI9lMYSpw7nQwtp6h/N+0od3R9XAGR5X0eRwtkaB9U5Yo2JnF71HhdM/oQBRChc44WpF/
 TQ0kk2rPnh/u6ar7RToG1SC8JdcJNQBep8T9kHXHncCqngzB4Fdl9BWyuFLbEApsnitKKuurdHD
 Jupt8gI5+ENY9MlzBR22wFngXBJQ5INs6F9pyXup1TWbndV3tYB30qfeHaw91IGQqv33ZLux8mE
 HgoWjZXGVruXtLk0VNo3D/Gk7jKm4XMRln18h8fIEQmU9R1EIMS12+3vIf7u9RCO3KzvJ5Cwg9L
 rnKm6UdidbsR84A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-04 10:40 +0800, Xilin Wu wrote:
> On 11/4/2026 6:29 AM, Nicolas Dufresne wrote:
> > Le mardi 03 novembre 2026 à 23:00 +0100, Bryan O'Donoghue a écrit :
> >> On 29/10/2026 04:58, Xilin Wu wrote:
> >>> This series adds features and fixes to Iris HFI gen2 to support
> >>> qcom-va-driver [1], a userspace VA-API backend for the V4L2 stateful codec
> >>> interface.
> >>>
> >>> It enables decode-order output and larger CAPTURE buffer pools for VA-API
> >>> clients, and exposes encoder deblocking controls. It also fixes
> >>> error-buffer timestamps and handling of non-display AV1 and VP9 pictures,
> >>> which affect both VA-API and direct V4L2 clients.
> >>>
> >>> [1]https://github.com/radxa-pkg/qcom-va-driver
> >>
> >> Is this code based on https://github.com/intel/libva and is there a
> >> route to getting it into the upstream of that repository ?
> > 
> > libva is the runtime, qcom-va-driver is a driver, so that won't happen. Also,
> > qcom-va-drivers does all sort of guessing heuristic, bitstream crafting and the
> > readme show that it cost as much as 15% in throuput performance. Let's be
> > honest, this is a bit of hack, not really a solution. A proper stateless
> > firmware and driver would do a way better job and reduce complexity instead of
> > increasing it. The provided patches though seems to all have merit, matching
> > feature with venus, fixing bugs. A bit of spec work would not hurt though.
> > 
> > Nicolas
> 
> Hi Nicolas,
> 
> The userspace software ecosystem around stateful V4L2 has long been a 
> challenge. With qcom-va-driver, we're trying to provide users with an 
> optional, as-out-of-the-box-as-possible solution that works with 
> existing VA-API applications.
> 
> I'm not sure whether the Qualcomm Iris hardware is capable of supporting 
> a stateless interface.
> 
> As far as I know, some folks at Qualcomm are also working on getting 
> qcom-va-driver into Debian:
> https://tracker.debian.org/pkg/qcom-va-driver
> 
> Thanks for reviewing the patches!
> 
> -- 
> Best regards,
> Xilin Wu <sophon@radxa.com>

Iris can do some kind of stateless but that very much needs to be scoped
out and developed further. Windows DXVA is public, some scoping work has
been done on that too.

Putative future work on Iris to enable stateless need not block taking in
these patches in the meantime.

As the proverb goes "A bird in the hand is worth two in the bush".

Generally speaking I think these patches are close to mergable so if you
can address the outstanding comments I see no barrier in principle to
taking them. 

The gap in browser support in particular is a pain point I'd like to see
removed for the community.

---
bod
---
bod

