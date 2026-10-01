Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72B2BE7A7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820974; cv=none; b=L9yPLBHyNVU7iOPqqopYrIMpKu+ljtUK6oRy+PRLAkcrXMlaoTofMe/pm58YLBtHuDl0GejGDmMZ0/Rhg66Kra9sW6uG6LdwXyzi1uYH6RhAx6SPPJejmWKAY5GPkn2Z3LiyqZuZh5wk7WQVQEKeDdcj5As4RcNJjSucyQUsTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820974; c=relaxed/simple;
	bh=nX2jBnvYS8wUE2Qbi8u0pjLWxyB9s0VVXYISCK8NbOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxvgVqa0TdLqn1ZtMU5nj+JZ0eL8airjEvHXhfASkhzzmr7IhXT0bFO5ggZnXazLwB3xuWIMDhV6KU9PLY9WXEjgRPnJu1AizqOwje+hM/sFL0NbdePEYoawAyrpbWtKmJimOBGyZ3fzJ4ln8sDSqbviFkGD0A4a8H8j8xQ1KW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5jB6y4R; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5jB6y4R"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a36887bso3376888b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820972; x=1791425772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQJet65ckrbNTaiHK5Z2CMeUS22oqKRz0qD2/TS3z8g=;
        b=O5jB6y4RZhB+mnHOi3LCSpZga3aOSGizh/o3pVnBgyzKjIVbbrPf8/yq0SlSlSmEBx
         TvsEV4kRL/+Ztkn/56MVChpKslJXkcCLSvOgqjC1RLhQJfSTyum607hgiND7v4f8cwow
         zK/XFPXxNFjg53I3fVOp7w5No5WawsWljDTe0oiI6J/urpTKmHsCIidPnsN31LEGCItv
         42L33wemIg9lxmeEHs+8JCl56PyMygDSE23D/2y5o9JLaQturfJM20l49DmQWpbUC3zn
         9vwUYi5YvD+bqL+jQB4TM0mo2wXn9EraWd8VFepAodbPwyoIvbIvoY9Kj6Y8AjiKn8WV
         AHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820972; x=1791425772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQJet65ckrbNTaiHK5Z2CMeUS22oqKRz0qD2/TS3z8g=;
        b=Z9B7IrT7KCj5vAVzBdHuVSgh144QDnthkZmpNJADGpfV0YxI1fUcg6GjvNGifcQpIG
         ClQpvFYOPk+GEdtNCgUJos7gAm5DKP0ELIzGy/7ezEaQXlUZVh/smTJ4fkSFQrPUYU1Q
         gMAAiPGBWNXhUUnnKgmMO2isf1ojppyMeCTlbjY3SZjnUiLowngtMq8IcC2/QCVBrNI6
         sLXvHlJYPcna2BbE3AjXydcoqhT4tYFa0KsdS31hTApFCoRs6FSgphFpy336NcmPGXM7
         7gLCUmfInKoD8i3h8r0yLm/8QHeilDCh5rMPdpFIW8P3gl1NsZVK2YzDiGOHKyKDTo/d
         4gpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHwP9PYUBuLWHK+PT0LLmILeSJgs1aua2P2KzW01XPQ0v0+dZ43QTloQdwdEMWvToZfKC1HLnYvnv14Lw=@vger.kernel.org
X-Gm-Message-State: AFuF++k9fbRqHcsCkD7fh8HcgwZu+91TOYFctPWwV199fmwYPyijWWS5
	ihf6Isxtm8soeHugiPcopc3HpUVS60IVKew7igDTHSgQG4tyJgUfDiRd
X-Gm-Gg: AYBFou0S1y7ZN7pw5Y3eaVK41+VAZT2vLuY2QN+nHob32scHE09WlCbkcviNt9/VFze
	1+UkhJ8SnoI7Gv1FyScqfueQuEHF4JuSZStv2xcbSpr5h6JzywO3HYm0MMnKeAFCHL5RSXr72nA
	kTlJkO35bH4fxC6OgvZ61GZMD37erj4rMcBvCRfPW/7tt9dL2KDAkR3+hRfN3uAOnXi1selLiED
	iatdiTGaAbmwl2DKoESVD7RxMPxTZRNQBGi0pbESt8DiFDkKhnwggal4CsxqiNfaUGIsAuoKqT8
	2xDg1iGL20gm87Xrcrwg1T+HfA79s+wFGQHXeuoHl8cWpsaHOLX1kJX/1VnMJK7QIk9g0aaiSXp
	IsBkjJGqSnZHbdmuWRkYl6TWJCaEQHEvAsW1qIkyGqwnN58EvFAFdAMg1SUwmS9p244E1JAJkc9
	S4oOfrwLqZy61GpQ7p5FlQXg4uT9e71dT9KGL2f6oLQE8mPfhihVLSiA1QXlRe2JsB7sA9w/YtR
	3C1DnACTcr5A3AlOS+c6lujFHiArWsJZoa/T7DE
X-Received: by 2002:a05:6808:1489:b0:4b1:b83a:5878 with SMTP id 5614622812f47-4f1b688af5dmr4764409b6e.14.1790820972123;
        Wed, 30 Sep 2026 19:16:12 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f345b14325sm1208801b6e.1.2026.09.30.19.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:16:10 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Samuel Moelius <sam.moelius@trailofbits.com>,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] selftests: gpio: enable GPIO_CDEV_V1 for gpio-cdev-uaf
Date: Wed, 30 Sep 2026 21:16:08 -0500
Message-ID: <20261001021609.167505-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-cdev-uaf.sh also tests linehandle and lineevent file descriptors,
which only exist with CONFIG_GPIO_CDEV_V1. Since commit 7673e4c7f7f9
("Do not enable the v1 uAPI by default") that option is off unless
asked for, and the gpio selftest config doesn't ask for it. Built with
that config, GPIO_GET_LINEHANDLE_IOCTL fails with EINVAL and the test
stops at its second step:

  # 2. linehandle
  # 2.1. ioctl
  # failed to get handle FD
  # failed to test handle ioctl
  # GPIO gpio-cdev-uaf test FAIL

Add the option to the config.

Fixes: c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on v7.3-rc5 (x86_64, KASAN and lockdep, virtme-ng) with a
    kernel config merged with tools/testing/selftests/gpio/config:
    - current config (GPIO_CDEV_V1 not set): gpio-cdev-uaf.sh fails at
      "2.1. ioctl" as above.
    - with this patch (GPIO_CDEV_V1=y is the only config change):
      gpio-cdev-uaf.sh passes, as does gpio-mockup.sh -t cdev_v1 (with
      2/2). No KASAN or lockdep reports.

 tools/testing/selftests/gpio/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/gpio/config b/tools/testing/selftests/gpio/config
index 1287abeaac7e..54cf6484441b 100644
--- a/tools/testing/selftests/gpio/config
+++ b/tools/testing/selftests/gpio/config
@@ -1,5 +1,6 @@
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_CDEV=y
+CONFIG_GPIO_CDEV_V1=y
 CONFIG_GPIO_MOCKUP=m
 CONFIG_GPIO_SIM=m
 CONFIG_GPIO_AGGREGATOR=m
-- 
2.55.0

