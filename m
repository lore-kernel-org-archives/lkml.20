Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49925490BF9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222463; cv=none; b=EFoiKfLWz08otq6VfY7msyVEH8ssOTYe50Sp5SnOmRAWMSJVELWu6AiJGKM6AuT9KRAQh1l7eN1A69qn+BVO263+q2HWRUPxDz8upEhuLmRJjxK3kPxXQWfRANDYqOWbIDdUebdWO5+36KvHwdjtTlMxlMWjQiFCv79/T9iUmZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222463; c=relaxed/simple;
	bh=yApz2mq8XiJepKkfDAITxGQeptAO8n7VIcq9D1JzGxc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N8VU4dTrs24X0URxvDmPyba+7LUhVdtzqDYAy3dqc66TJ/sXaeBgztN3jqYBJNxxkIRn6iDvSuCgyr3vBoM7NaFlMmIWkfzH01CRu1OgyFoMHqvUqFbRUxfczs/RZwwAuEsWlJElfZC248/CQVnPfwLfmBVduQ7ttE+fKIdtTqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jhskImOm; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jhskImOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1791222452; x=1791481652;
	bh=yApz2mq8XiJepKkfDAITxGQeptAO8n7VIcq9D1JzGxc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jhskImOmtDUJOdJIuwhao4p9oO9Df/ozNWIqwh9PLqbxwAG7Pnov5jasYRFYOQiy7
	 mzJwPrIvpfSwfJ11RUsBo+TGVJv7jwlTMI8ZGAnJbiAQSg7rP9xOYchWKqQYyQrSCT
	 NcrCcBgB9MU2ZA8sYIYuO8oOhDyp/1U+b04ZzluYhUyAeBluZQWDjUDhW4gwJQv4EG
	 rVZoTdfP3G7TvpntVO20AY1AcmpZTv1L4sr+bDzV+e1buzj7DBb0AlNHbxdgG7RWn5
	 7QikfIhdfBDsGuvB/ehinzHvN6d4rrx6c3xHisfcKwy2igVdMO4BcpuS/TzFF94jYF
	 bKLSF2mBq8CQA==
Date: Mon, 05 Oct 2026 17:47:27 +0000
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH] cpufreq: Add Milos to cpufreq-dt-platdev blocklist
Message-ID: <20261005-milos-cpufreq-blocklist-v1-1-7af4eba81696@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: be5d155c6d87f6914a868e893a769b451f16b483
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Qualcomm Milos platform uses the qcom-cpufreq-hw driver so add it
to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq=
-dt-platdev.c
index 371ca1fe9020..574c5bec4831 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initcons=
t =3D {
 =09{ .compatible =3D "nvidia,tegra234", },
=20
 =09{ .compatible =3D "qcom,apq8096", },
+=09{ .compatible =3D "qcom,milos", },
 =09{ .compatible =3D "qcom,msm8909", },
 =09{ .compatible =3D "qcom,msm8996", },
 =09{ .compatible =3D "qcom,msm8998", },

---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261005-milos-cpufreq-blocklist-b7bbe1a4eb5b

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


