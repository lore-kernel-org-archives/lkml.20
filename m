Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104760;
	b=1+YBCgnBt3rJpA6ctP5GMssavKDlkPRJTzobUhxjRFNVxNyI3JC1lW99Ip2OETpjyfUy
	 VI8w1MI8R9UukVUW2s4X9SxzSOfY8i5hN//0iD/B1Qq4ZtjNl8U+07rKi5RJeb1NNuJ4p
	 soIcKRZJrK5ZOA5I9Lx6/0zX+bMb8Gr6LPm3uknSLK9VVg0jcGlFGlPqlqHMn07ek5Vs5
	 s7q3y89J1Sl5FSO02uQGUO76++hQbNpwHs8knXFCHQADJEiQ1ujPq+jNwGDg6hse6xbib
	 CDo4rhXq7CljqnMh6FkkMr3trBzgeNzydhQriYhrOzVoqgvUCSmeyA034zDWxc+d4ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104760;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=+WLa3149mYOJ97icd2XvjZK5rfR4zcVYMglbkstm6AI=;
	b=YwlZq8CT+4Q3oCxyZZql7KfWpqxS364Vz+AqbgJj5vjNghe3BNKBkvTQW00MMTlHMRpq
	 PN9lbLS+kc0+RL55I6hb6b3i+7y3Zx1vU3uyjZU6ehYpkPiq2xxY6c7DsgvAyvUQ+a1LE
	 hH2TlBVJfaluT8eVadzdKTE080UR1hpCBRNi4jVsc5dgJyHRgBm62Vul0FBLE58MOu/HJ
	 p5U71rPCSK05WUqfdAl9suS65DtTDSMvIEW5IDYnZEBvOSsLeclcKyzEnzbgAsTZY2cGQ
	 wqByDLmlp6lwK8qbt3sfGcLSwERI/g/ntFD3xk4BmN5YwBI5+cuiYQa5iuAP+GXnlIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwRmnKOd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CBA60A381E;
	Tue, 27 Oct 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwRmnKOd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5E01F01828;
	Tue, 27 Oct 2026 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104759;
	bh=+WLa3149mYOJ97icd2XvjZK5rfR4zcVYMglbkstm6AI=;
	h=From:Subject:Date:To:Cc;
	b=UwRmnKOd093rhXtjRWWyKfEg2xCrZfYJ12EnXgleA9KvU0+R2cnl+/cubP8iKz4Ei
	 lorCJ6KrrWlM76p9DBb+Bd9Nvh6GXop/NsyDT+znxI6OiUn5ozCjmEYzw+pBne5VkW
	 +rit73S0tyiXA+rmA2SuIzgagsK1b0r4pl9HrTmZSK/zLIN8QiIomlcdcSsC1sSaDQ
	 nG876QeVLGxsRP0SaGJvPG/2BdwGOpsNwI8t/lNLAUztrb/hlc/B7VIFnpiSwzTY2o
	 BsHcgQu4p1BVKpiTutoSULFb0o5uSSvP9joIBSmJ4bvnJGeX+13wgpsJoTG1AFCc8D
	 OuWBznAhxut3w==
From: Sumit Garg <sumit.garg@kernel.org>
Subject: [PATCH v2 0/3] media: qcom: Skip SCM secure memory protection with
 OP-TEE PAS backend
Date: Tue, 27 Oct 2026 18:09:02 +0530
Message-Id: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGab4GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3YLEYt2yzJTUfF0z02Rz4zQTC6MkIwMloPqCotS0zAqwWdGxtbU
 AexwP5FsAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0

The Qualcomm peripheral authentication service (PAS) can be serviced by
either the SCM (TrustZone) backend or, on OP-TEE based platforms, by the
OP-TEE backend. qcom_scm_mem_protect_video_var() is only implemented by
the SCM backend; with OP-TEE the TEE itself owns secure memory
protection and does not service this call. Issuing it unconditionally on
an OP-TEE backend fails firmware bring-up for the venus and iris video
codecs.

Patch 1 adds an optional PAS op along with a generic
qcom_pas_mem_protect_video_var() wrapper. The SCM backend maps it to the
existing SCM call, while backends that leave it unset get a no-op.
Patch 2 switches the venus and iris drivers to the new API, so that they
stay agnostic of the active PAS backend, and drops their Kconfig
dependency on QCOM_SCM. Patch 3 folds the SCM call into the SCM PAS
backend and drops its export.

No functional change is intended for the SCM backend.

Changes in v2:
- Dropped the qcom_pas_get_backend() helper and the backend name
  matching in the video drivers, as suggested by Konrad and Vikash.
- Stubbed the video memory protection call via the generic PAS layer
  instead, with the SCM backend reusing the existing abstraction.
- Dropped the QCOM_SCM Kconfig selection from the venus and iris drivers.
- Added patch 3 to drop the export of qcom_scm_mem_protect_video_var().
- Link to v1: https://lore.kernel.org/all/20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org/

---
Sumit Garg (3):
      firmware: qcom: pas: Add optional video memory protection op
      media: qcom: Use PAS API for video memory protection
      firmware: qcom: scm: Drop export of qcom_scm_mem_protect_video_var()

 drivers/firmware/qcom/qcom_pas.c                 | 27 +++++++++++++
 drivers/firmware/qcom/qcom_pas.h                 |  5 +++
 drivers/firmware/qcom/qcom_scm.c                 | 48 ++++++++++++------------
 drivers/media/platform/qcom/iris/Kconfig         |  1 -
 drivers/media/platform/qcom/iris/iris_firmware.c |  5 +--
 drivers/media/platform/qcom/venus/Kconfig        |  1 -
 drivers/media/platform/qcom/venus/firmware.c     |  3 +-
 include/linux/firmware/qcom/qcom_pas.h           |  2 +
 include/linux/firmware/qcom/qcom_scm.h           |  2 -
 9 files changed, 61 insertions(+), 33 deletions(-)
---
base-commit: 75a4de0d94f62bce938ebcacd8a7a8ed35a0439b
change-id: 20261027-pas-video-65c73f482b20

Best regards,
-- 
Sumit Garg <sumit.garg@oss.qualcomm.com>

