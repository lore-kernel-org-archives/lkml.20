Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1917B425
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694921; cv=none; b=XacqQUoBMic+JvEUJnTyikpYfYCrYBkWpiDgdkKmwdaNb85sMPaEgGyiq5NanXno2iI2XACvjn2IIf7tXpjrrDCq60ryrYuFlyxnAjCQg8vTUpbJL9zzhCnfNOkLRYxdbEOEs38suRtOW/fwguamc2s3m7VvHKzom7MFPnm5GsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694921; c=relaxed/simple;
	bh=9wGZ3uW3JCvaV6GCi4Pwu367A/BCj54JekdWGEgTalY=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=YfXrQ6OQKr6LFggMLfhOkkmHifgxMgSTTpC3FJC6xq48bHpgfHlrk0jHUYFPGxJg7TtlNp1N8f+3IjkoYpSMAHMxVewp1GAwFgcnKPPdCgwPrsxz4KBXCuRKK1Con0QWWouZnEzDnAqn/dJPBYtFPn4h2Ffx9qBAeKHEWzfUJfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdvJmlIV; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdvJmlIV"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8535a9be75eso1923790b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694919; x=1789299719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sj44NAeIxHURpVAbMjqn23Nd1CJqn9f7LlCNmzDV2Qw=;
        b=NdvJmlIVJ5bUv4G2vOhKPudPhMkeS8RQKx5uA6itgWq6wFgxprIXZ9ynwX01zQ5yap
         9GlrqnxJ0ju6rbqfMXgVQvG1jtSrDDlCZpAaLR2g7agXYuRND7B/Rl8CDbGWV0IPPwQE
         foyGAmtycCua1462nheqK+P7NHAPeDYEotLU921wmtLa5kEE7HO7BuSl+k//t74sAhua
         VtfLoHKPpWQ8/6aBCJ39mjPPkWBjjPsqZBhntCrdHL31eaTerqB+KVv1NNRYyOxP7VCV
         sVX5CnU+D5HN/JXpIBtYos4XRmearkbxHRMpjstpseadMPDJP0eijjxCnAZmHOX8uj8W
         v1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694919; x=1789299719;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sj44NAeIxHURpVAbMjqn23Nd1CJqn9f7LlCNmzDV2Qw=;
        b=SJL7P43MhCER8xA9MI6dkO5t9iyLoMmhpPhqc5mX6paaSEBq3+Z0dMNOfBaiq3D+QS
         ZBXYNLN0vV33vIEeFknvJfaQxDC4lNfTCcg3GZDVPSvkFAvohR+UdAse2ZbjXgTRdzPi
         N5/0pFXxXYiGYZ8Hnmlbp1oHt+zLKOcuD6W1IUdvbX+JYEqnDzTeV8eV8QFISstrU6Zs
         sTjj2EtNWyuFUD8/RthfAcI4PSn58xIlWkfyNi33m3u3FXAeoRYsJNd5c55pEKWdZ5Yh
         GJvrp8ueqFoefWIzcCnkxI7vCBYpOSvWPm15iBXksQlIHmKZb81HzSl6ZKghxmf8M11s
         xthA==
X-Forwarded-Encrypted: i=1; AKwUvBwjv2RQ1vxX1iLtQLEEx3x6JeZAlxyuKLGqtAdP/AJ8Xahmi9DyN3CiQX0VM4AoxMmfSTZte+iz6xvzoQM=@vger.kernel.org
X-Gm-Message-State: AFuF++llqijQHwlD8UdihcjZgQGJA3YR8MmJ9rzcsZBgrvw+aqhHN8yP
	srwqDqDZ3UaPZoUA29UUT+BSgx3+2NWCktySlKDQ+NfqZ7HU82vWRr/L
X-Gm-Gg: AYBFou0nTWU4h7RlUNvc4S7ZDRVQnVzGTcXuG3dfKSUXCUlD9gHQR0h//yCG6BHcwEh
	VuKctUXkC7sl3B9joyxqI+9kva84568q/4zvXUrHAgZI9KRjodCpkn+K4CwvtYu00MVe0dJWCP9
	ULKoG6FEnp2zeZv5Rk3aI3Wmd33z2TWpm4iwIAUf0g6Q4A4W3e3exjDj6ButDKkot9r3+B9U6wX
	+P6C0X+DE3KqwfeEa1/bHgZPDYn+jJKg3zFdB90wmj/KFugajp5sbC9ZO350StaINyKO4n36v3J
	/Yjt9eh9niB9Nw81U9JwfNS85TeQrDCOtKa/r1lzEPh2xwmKlG/U2BLaI/nR1FGvR8yNa6pF2m8
	KMwjQjOafsZi75F85GUKj0qmTH+k3AJ0LtO0Ephm70/vWmX3hpJO2BV7GNpC8WQna+ZWcTfkWkD
	I/rM2XasA0uec8lqwLnQQ8ru0gx8qHSYcjRvEcvWqy+qucCGXjKNvKmGO1dzLy92q9bHHnsR/cB
	5vtXxwb8BstCyghhR5g9yhKX/Cys2SMo1Xzov3D/C9V8td0kjek+lATYw==
X-Received: by 2002:a05:6a20:568e:b0:3c4:4272:b400 with SMTP id adf61e73a8af0-3da39fd2525mr26788303637.18.1788694919353;
        Sun, 06 Sep 2026 04:41:59 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm19568798eec.22.2026.09.06.04.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:41:59 -0700 (PDT)
Message-ID: <6a9d5187.d63de05c.175391.a17c@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: ukleinek@kernel.org
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: 6 Sep 2026 17:11:58 +0530
Subject: [PATCH] pwm: lp3943: fix NULL pointer dereference for an
 unconfigured channel
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

lp3943_pwm_probe() unconditionally registers a pwmchip with=0D=0A=
LP3943_NUM_PWMS(2) hwpwm channels, but lp3943_pwm_parse_dt() only=
=0D=0Apopulates pdata->pwms[i] for the channels whose ti,pwm0/ti,=
pwm1=0D=0Aproperty is actually present in the devicetree (the bin=
ding=0D=0Aexplicitly allows each PWM generator to drive zero or m=
ore outputs,=0D=0Aand lp3943_pwm_parse_dt() only fails outright w=
ith -ENODATA if=0D=0A*neither* property is present). A devicetree=
 that configures only one=0D=0Aof the two channels leaves pdata->=
pwms[] NULL for the other.=0D=0A=0D=0Alp3943_pwm_request_map() de=
references pdata->pwms[hwpwm] with no NULL=0D=0Acheck:=0D=0A=0D=0A=
	pwm_map->output =3D pdata->pwms[hwpwm]->output;=0D=0A	pwm_map->n=
um_outputs =3D pdata->pwms[hwpwm]->num_outputs;=0D=0A=0D=0Aso req=
uesting the unconfigured channel (e.g. exporting it from=0D=0Asys=
fs) crashes with a NULL pointer dereference instead of failing=0D=0A=
cleanly.=0D=0A=0D=0AReturn -ENODEV from lp3943_pwm_request_map() =
when the channel was=0D=0Anever configured, before the pointer is=
 dereferenced. The caller,=0D=0Alp3943_pwm_request(), already pro=
pagates an ERR_PTR return correctly=0D=0A(it does so today for th=
e existing -EBUSY case).=0D=0A=0D=0AReported-by: Sashiko AI revie=
w <sashiko-bot@kernel.org>=0D=0ACloses: https://sashiko.dev/#/pat=
chset/6a9d4c6b.79b5ea6e.147aa1.5883@mx.google.com?part=3D1=0D=0AS=
igned-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A--=
-=0D=0A drivers/pwm/pwm-lp3943.c | 3 +++=0D=0A 1 file changed, 3 =
insertions(+)=0D=0A=0D=0Adiff --git a/drivers/pwm/pwm-lp3943.c b/=
drivers/pwm/pwm-lp3943.c=0D=0Aindex e8bb8dbb9..956d22053 100644=0D=0A=
--- a/drivers/pwm/pwm-lp3943.c=0D=0A+++ b/drivers/pwm/pwm-lp3943.=
c=0D=0A@@ -38,6 +38,9 @@ lp3943_pwm_request_map(struct lp3943_pwm=
 *lp3943_pwm, int hwpwm)=0D=0A 	struct lp3943_pwm_map *pwm_map =3D=
 &lp3943_pwm->pwm_map[hwpwm];=0D=0A 	int i, offset;=0D=0A =0D=0A+=
	if (!pdata->pwms[hwpwm])=0D=0A+		return ERR_PTR(-ENODEV);=0D=0A+=
=0D=0A 	pwm_map->output =3D pdata->pwms[hwpwm]->output;=0D=0A 	pw=
m_map->num_outputs =3D pdata->pwms[hwpwm]->num_outputs;=0D=0A =0D=0A=
-- =0D=0A2.46.2.windows.1=0D=0A

