Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790586;
	b=NogjzRiatibLUxfQ4MdmjVRxxxTAbd68czgnlF6IP7Ik0B5L6LgCIqm5riTFWDfCLjt/
	 Z0/Pvsl5a9xpTvnQCHwvrXGWnu2b8OhhCBGzZ1IRcAYgPez1uPfHGT3Q+Td4X1/rkL3MS
	 wLfRz10o/scMgzcnKpE3jqmDwju5O02M9NuNlKc/UQDwG7FFyLl1HprKoImu7cX5njR6T
	 GtiZbCEG5Q2na3keaD3Wjk63bJuRefloaCyTkIq69SNGw9TE8+X/C8k2YUOIxULPuSdC/
	 WbuuIWh30epAZZayZLAsBZz2Tfk3mghMLgh0PT0jfrHcqLz19aJ/nclTKObXw4jBGpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790586;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WEMs7rQw6AdOQXqzfBdwPxPdLU8/256/fvh0xtNBmOc=;
	b=jdHhq9t55OnS0hxsRW87cC0wVDTCCKnNnDETnkGqg2h2N01lLLu5vTVfawtcPGlq5Fx/
	 rqA0TnD664wB0ugm1VnBuGOkIK0q46rC+0QTeJCB1ilkEK4hW/c72Ke7jNvDeErXoA3kD
	 4CW4VuqZuPceCpNQBOU5vMUpd10sQivzFJpBRPLqXmTxP5oUoP7WVKRKQ9W+iTB9OKw/+
	 twvpK5wMftGeN0tl0AUrhEBaT7Nl1beNTTpWO9lCihU0oITJ1BseIgyLMKwt7eV3mDd0v
	 Gnr+hXHZG3X1frQC7jvtKCmHnnSOMCuNvniSRUvn1Efo4xjLq61O34yEOeTzUUx95mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=YdfZe3IM;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A95606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A95606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=YdfZe3IM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794790582; x=1795049782;
	bh=WEMs7rQw6AdOQXqzfBdwPxPdLU8/256/fvh0xtNBmOc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YdfZe3IMJh9UK2QUTD8C9oZHJJjYWijt8eG832SY94Y9MzV0ehDK4QYgitek3Byo8
	 WQ5vlmmfyJbQVo4OnCYMqffqO9UexPjsKa5+gFg1ZwOs25zBW+8YrF4mebhcYPnOEc
	 shHqSEAEO+t8AdgwGl34u7BdOdyzoHgtehT0eZi87PvuHD0sR1MmxXIiQercjbTFKa
	 XouzeJXzUMkbrdTX2ZTkbG8OTEO6PAUXBMAz1S4LKUn1EVMZLF250CcoApY6CrRp7/
	 NSoNoLO8mb05mkMm5PqidhywCnvhpeHrXPiKwfGPJlqoDo8icWTs74DhDJu5qBgIGd
	 ZxB3HMRhN1G0g==
Date: Mon, 16 Nov 2026 00:56:17 +0000
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Avraham Stern <avraham.stern@intel.com>, Kees Cook <kees@kernel.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: iwlwifi: mei: fix const qualifier of the NVM allocation
Message-ID: <20261116-iwlmei-nvm-const-0c16d1de@empyreal.works>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 56ac4cd561a6979cdeab8ce325c7b2d3c160fbf7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Commit 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for
non-scalar types") turned the allocation of mei->nvm in
iwl_mei_handle_nvm() into kzalloc_obj(*mei_nvm). mei_nvm points to the
received SAP message and is const-qualified, so the allocation is typed
const struct iwl_mei_nvm * and assigning it to mei->nvm discards the
qualifier:

  drivers/net/wireless/intel/iwlwifi/mei/main.c:890:18: error: assignment d=
iscards 'const' qualifier from pointer target type [-Werror=3Ddiscarded-qua=
lifiers]

This is a warning by default and breaks the build with CONFIG_WERROR. It
went unnoticed because IWLMEI depends on BROKEN.

Size the allocation by the destination instead and drop mei_nvm, which
has no other use.

Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-sc=
alar types")
Signed-off-by: Andrei Rusu de Castro <arc@empyreal.works>
---
 drivers/net/wireless/intel/iwlwifi/mei/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mei/main.c b/drivers/net/wi=
reless/intel/iwlwifi/mei/main.c
index ce92e26c42d7..d260bc5b96c3 100644
--- a/drivers/net/wireless/intel/iwlwifi/mei/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/mei/main.c
@@ -883,11 +883,10 @@ static void iwl_mei_handle_nvm(struct mei_cl_device *=
cldev,
 =09=09=09       const struct iwl_sap_nvm *sap_nvm)
 {
 =09struct iwl_mei *mei =3D mei_cldev_get_drvdata(cldev);
-=09const struct iwl_mei_nvm *mei_nvm =3D (const void *)sap_nvm;
 =09int i;
=20
 =09kfree(mei->nvm);
-=09mei->nvm =3D kzalloc_obj(*mei_nvm);
+=09mei->nvm =3D kzalloc_obj(*mei->nvm);
 =09if (!mei->nvm)
 =09=09return;
=20
--=20
2.55.0


