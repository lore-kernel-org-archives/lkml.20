Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150534DCC8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608368; cv=none; b=jfrC8387bjGuYIwGAMEV3kkqFzpi5wDaNOSklRmN703u9vjXLZ09sKwwUIdL7uKrS0yWUhe7f2eN+t5UjHq3oo1BoLmPFgyg6/vleLMh7wbhwacB90JxeYNKCMdwFpip1Niygy0FlsFKKLfbnCQtNwD9Ul6ysfhHIYFZsflkjzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608368; c=relaxed/simple;
	bh=P7yCH5kYXrmTKOJ0FGZzZuy+blQgstUKAmh/g+oX51s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuPyHiHU0TYXpSdUizs3+pCX2srap9YFjwyT3rGsmEHtQwRhGZnd5lhpioT4ouqHj/3nXHpJtAQgQqlcDx9LsP1fFk9BiSjiKSlNOhxFY6q0MM+DyJMVoAsETvn8Vpbaa8FgUGp5NmKaJgJni3666N1Q1ICaJfl33UM58NpYmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=ncNbsusu; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="ncNbsusu"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917b78dfe30so7699396d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791608365; x=1792213165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nRDOlvFA2YLyiFZW2o7vc4YCb0RwgsJ9ji12ZBwLmc=;
        b=ncNbsusu7y+0/8uWqVIiOntLT/54Az/z+wnfEmqhHHpJyAZ3/WQzXQ6wcBAnqOU5C8
         mjxK7KJuCrBPKYj++Un1y+/uO2v9VfByLOwPPEJorxl+w4njSQG/OA1xKKHqYOoDlX+b
         OGro8H+/vrYLmahe7fJ/I1BuaeqGWLLUWg+P+b5yGTYtMQmejNSO0nyZwHYrQN5I9CUQ
         +e3e5otVB50XgEa5QmwV1j/+VuiWRb5djsV5LYl6BG0kBoWmDd0qpUZ5FMucXkAZqRZM
         +A0ckSzeNkuSHRhB+UQttiOvFBJRG4pNzp/qK4rep9nHkYJXUMsL9l/Szvfl5EK6gE1K
         q19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608365; x=1792213165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nRDOlvFA2YLyiFZW2o7vc4YCb0RwgsJ9ji12ZBwLmc=;
        b=QjDMc6JPlRge7PMtq2XYEkNjz7zWGT1BVYVmeTBy8M5IL1rGLH4jXFU64G7mNpoFoU
         AD3rWoz4aqd+mzETt1mfL5o66aM4RCJVNiQxLwmpRM30VAY3rNlgBH/+3pI9qJhdfJVq
         7EhZY8upL+nycvdaBntU6Sy5on3JXbq3GkwhydDF2V8R7dob3bTwLrbYVvsG/QIuoSQx
         o+fOocyZ+1+T7489BcPQRbHergRXcDAqDx4A9qyMSncmRi74YbYbw6x/4D393r9isX+j
         PaR/vm08CWF/dCxMPorbjpfwvt0LYp+AwaX7M1hN2vzLq5ao0qJaxzTXfd31vZeqgLYq
         9P1g==
X-Forwarded-Encrypted: i=1; AKwUvBzqH6eWBnozi0xuKZJh58jsLrNARMJZk9TtHQdg4+2veiuKQxGrAv+XiyRmCHP5zUR49qE76rXCtCoo8jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ3YVwcBeh5sd0i2Ad/6G0cSRAHMuo7DUWftb8IbNohrcsdfAu
	U1y43Rj/X7g9p07kRoT2J7RyVkQle/icqJi5MP+algHAntKVrmC4rKJd6bcY15hNhD4=
X-Gm-Gg: AYBFou2I7JWPj5tndf4qyjs6DJjoF2Hhpws5DxmqPxNxFRVGc0RCrDzCooDjYc3+FNS
	f6OLxAeococxLngma177PlFZNzHSn4yXEqDjTr27fJvMbNOhNX0aFFVBBKWMIs+3gp9YN0NmcmX
	AiUk98rpNn2p3ioXIlPvmlhlpQN9/ANHGEV7bjw2zUcLr7ms1OkT59faIHiA2hVvwXRP/yhyhxz
	9l8sU2B2chtX9gBLS7Ci8UiLieKKxPRzjzbFuiN263jQnkGX16EcYQ/Smc7LIKjm3pbRA99CZE3
	rRkCw2z7JnNP6SS/trWyA86HUHrwllvBLtSW/4LVVo/7jocOoTgSumNQvAvbvZvWjr6D5LA/PkY
	ki5ttxsXZiWYJ4TWgFJlZ/owIts43KN+wnMcp6YDmx/HuYlWglptVf/WkJ1iT5vH182YHI9o1R+
	fgUAX3FTYeBbnHh3T/ZdMAS1CqPUekf5Yk0pIiUgnKwdSccZFdQt172r6ZR6/BjDuqrDtFp2uQ7
	TKpQ0iJp5ERQ9INOZ8t7UtwX9qDhLuFBFnHab0/IYlEuQjkKOM3gRBqZ0WK++7k2lIShLL+vxH0
	Hi+ml0W2ml2tCOKswSIqR7ED04beITppOexSC/zSs52eKi371LY3emUF1uEG32HUcYOa
X-Received: by 2002:a05:620a:261d:b0:93e:49eb:a274 with SMTP id af79cd13be357-93ebd225724mr641879885a.23.1791608365448;
        Fri, 09 Oct 2026 21:59:25 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550887ebsm35827736d6.33.2026.10.09.21.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:59:24 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: hm1092: Intel IPU (ACPI) support on top of v6
Date: Sat, 10 Oct 2026 00:59:20 -0400
Message-ID: <cover.1791608336.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ramshouriesh, Sakari,

These two patches make the HM1092 usable on Intel IPU laptops, where the
sensor is described in ACPI as HIMX1092. They apply on top of
"[PATCH v6 0/2] media: Add Himax HM1092 mono NIR sensor driver".

Patch 1 is for the sensor driver. v6 cannot bind on x86: there is no
ACPI match table, the 19.2 MHz clock these machines supply is rejected,
and the only mode is the 24 MHz one. The patch selects the configuration
from the clock rate and adds the 19.2 MHz / 648x368 / 180.48 MHz one.
The 24 MHz path is functionally unchanged. Ramshouriesh, feel free to
fold it into a v7 if you prefer that to a follow-up.

Patch 2 is independent of the sensor. The IPU7 capture nodes have no
pixel format for MEDIA_BUS_FMT_Y10_1X10, so no monochrome sensor can be
captured, whatever its driver.

Tested together on a Dell XPS 16 DA16260 (Panther Lake), kernel
7.3-rc5, with the ipu-bridge entry that is already in media/next:

  intel_ipu7_isys.isys intel_ipu7.isys.40: bind hm1092 17-0024 nlanes is 1 port is 2

  link_frequency  180480000
  pixel_rate      36096000
  exposure        min=2 max=719 default=360

  Y10   648x368, 1344 bytes per line, 10 frames, 4945920 bytes
  Y10P  648x368,  832 bytes per line, 10 frames, 3061760 bytes

  exposure 100: mean level  59
  exposure 700: mean level 198

Two things worth knowing when reviewing patch 1:

- The 19.2 MHz configuration reads X 0..1293 and Y 0..733, which is the
  full 1296x736 array including the dummy border. That is what the
  vendor sequence programs, so the crop rectangle reports it as is, and
  it lies outside the 1280x720 crop bounds v6 defines. I left the
  bounds alone. Say if you would rather have them widened.

- The 24 MHz configuration is compile-tested only here. I have no
  devicetree hardware with this sensor.

Regards,
Jake

Jake Steinman (2):
  media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz
    configuration
  media: staging/ipu7: Add 10-bit greyscale capture formats

 drivers/media/i2c/hm1092.c                   | 363 ++++++++++++++++---
 drivers/staging/media/ipu7/ipu7-isys-video.c |   4 +
 2 files changed, 321 insertions(+), 46 deletions(-)

-- 
2.56.0

