Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53A481241;
	Fri, 16 Oct 2026 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156297; cv=none; b=Y1nSxi9+FfEk7oMq+gC3Tki3PZb2KkBjBntSjNsmOxTQ2e60iWi1YgNssQMRBE/lV74ohgMU6JQSTEoWprhmyvw8CgN6xHO0YKN/7Fpq2ORSVR4F1srt1dlloqge9uM4QF95G9JpIymQG/ykVgkXN1mCrk6mXGhpja7ZZActwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156297; c=relaxed/simple;
	bh=sBZwMWlKkUtdIlno7jdnd9iB33P/c0dvjqdN8hZW4Eo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rekH5U91bkPxJtLRnTrJUMDPflcwKt/+eJSK+nTZU/D4EFoc0X43hE6bMpEauAjONsEDwy7IHbqWOrG9dPw+uRvlGHn+DxVR1dtDW6DOK+U7NIDLBRhaIdPa08rFhhyRuR6qPebY0tICto6An41Mi8D2lV6X2rV/WrLX9kokbhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Z3nDmtAs; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Z3nDmtAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792156286; x=1792415486;
	bh=sBZwMWlKkUtdIlno7jdnd9iB33P/c0dvjqdN8hZW4Eo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Z3nDmtAsJ7dSV3Wkg/BAG8wuitNihzQfAJ+c3c9M4JAdwxq1aDPSocAJBJOdxzZBn
	 a+CwA3S5XWsHh5etD7D2NX7AwPlysdbxOQTW7ieYJF1e4EFwW3GFr63qFbbVIpqGYl
	 912rEEJNdxeNOmORYE7e0szUdfqj2XKX2jPxfVlHyIHniEu4Yq+jOkRvIDh9r9VvV9
	 UznXPapvlT796rdrCh0K3ojd4r9HYYuikE0zwFtcaU1Xt3wPK5dR7qrPwvhgkNUDrI
	 dspHs6msLKhdldQ/VyUeTfhDBbG0IlFVRIU7ljY7tZyhD1hjMLOA9boAPIGEvpZdGm
	 N7HrJuv7YKlZQ==
Date: Fri, 16 Oct 2026 13:11:23 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: MrDataScience <MrDataScience@protonmail.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] docs: media: fix get_maintainer.pl reference
Message-ID: <y_LDAophorZqsEBlBhREgpJ7nu1R0RxA9KqHCnRjQKYT-NErmPWf-AzFRnszwOdFwT-weyu-6Z9CfUCBszt16lIdLGAqNOteChtcNVcteZM=@protonmail.com>
Feedback-ID: 220342908:user:proton
X-Pm-Message-ID: 3711ff9ec3e1f6574dfe3b694260e190d1ac1e0b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The media workflow refers to scripts/get_maintainers.pl, which doesn=
=E2=80=99t exist. Point contributors to scripts/get_maintainer.pl so they c=
an identify=C2=A0recipients for their patches.
Fixes: cc353539ec33 ("docs: media: update maintainer-entry-profile for mult=
i-committers")

Assisted-by: LLM
Signed-off-by: George Maxwell Aird <MrDataScience@protonmail.com>
---
Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/=
Documentation/driver-api/media/maintainer-entry-profile.rst
index 7806d83..2fbdfe2 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -232,7 +232,7 @@ you can find details about how to subscribe to it and t=
o see its archives at:
Emails with HTML will be automatically rejected by the mail server.

It could be wise to also copy the relevant Media Maintainer(s). You should =
use
-``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
+``scripts/get_maintainer.pl`` to identify whom else needs to be copied.
Please always copy driver's authors and maintainers.

To minimize the chance of merge conflicts for your patch series, and make i=
t

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
--
2.51.1
