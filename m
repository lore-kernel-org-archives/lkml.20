Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F823D45EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167608; cv=none; b=a4zhnB+tZr0FR9XbS0Gkq7A17cm8YwNZivj6Cua9RqFzdTPebRHhln7pKjpINVh5gzKIdqpNGE2vx4zP4oGEzii5pjIh7UWMUVGppgb0XBv3rgYS2LQtjuL7NqPv9h9WQIS+9UhWmvrCU4wxQLHn7rh/+76oGEjluwI22oC53sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167608; c=relaxed/simple;
	bh=RCLDTEg9lmjDKChkil90PiGZqmrbszJN9ZdDp2YVeWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D6aSMycjEL4l2Yf8T3aqGo/Hsz2RPPqkz2/gTBwTI498zk2/h6Av47XPG+nCdOD/OgWjLxWT3OHJ1h47IjRwQ0HOEk0DPUZMflYbHjVtaxQ/cn4cp64ywp927rVXakPIkZCNDrw8JnDpQCWWbFbSUb05mIz0UBOp8awgxlAX3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bG6QikmX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bG6QikmX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482f9309813so2121377f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788167605; x=1788772405; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kZSoUqRG3MmvbFrT0mr1y15pAZ0UP8ADHoAOFVsreA0=;
        b=bG6QikmX/ETnO37XpLbzMkPq5i6DMMPnAViyMTgkucZjIltn3pvsMw3c4ZivnP8pzi
         N9IsXPspN5T6lmG82c+wNj3nglJRwWriuNdHYvwVg3iNnMGjugkKi7vsMwP8wpJqjSHy
         WrjL3x50bWik/aNmXJwKyPHP26cqEgOKuySAbtliwk+1QddGrz84G4pKF5uRxjt+xISm
         XNIdmdRj9SkPPzhe5jcy0i+/WYTR4dQubrNM1I4myn9U1hCXixVQTcGbASaDpn7Ws8pG
         n+J3qUMbkn728BTGutq8mI15VtUPUMxX1V0+fL3Aazo5sUXKRPNfQFkjRm9a6FJ9jNft
         50Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167605; x=1788772405;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kZSoUqRG3MmvbFrT0mr1y15pAZ0UP8ADHoAOFVsreA0=;
        b=BtvvK/iP4j22+XFtlkRb6wZsa7HAjzE5au1kdskMnIUwITQIrONP3UnrFyum/xEpCA
         YWo2ayZzY+EX4iJ4m8tTC3LoC44a0TUDzWgao41ITfVgqF8NSJOqHwT2/SrsKZ+jr6jj
         5yEgXQOVhcy5cqJLZjpBdRlJZtR5SotUjmnW+6sURIBcIA6vwBYdcww7A46dmRE3w2OB
         1P8fpwaH4uctWLCF3Q7gFKsnEmeOpsvxru74eWcBnNNIdsrdxLokusYH3bqRFMmy/CtR
         cffqgLsAreOLOyZUPWMZuaFmQQJkkTVggJzWRkhLf4rIEUokbfqkV/8q4a8TEz8I++me
         V5Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpVIF/JFezZkcvfL/RYewrhs5In6Q361e9GTM+hT+DBDmtmO24TVhXrQZtOru2C3roEWCZl0baxsds5gug=@vger.kernel.org
X-Gm-Message-State: AFuF++nqdwULYcmdl4+7iJD6eZtHOYpdJseEdUZIsd+eYh7EvCVR/C7L
	XNOTsT2yg6cRezwDZZp6vd/wTHmqhwKVN9r8O4ZkEaXsCtBEYtqx7vFOD2W063QaIl0=
X-Gm-Gg: AR+sD114vJ1Wxu1T3eaugjylzdwSmON8K85J2scKKaSHpEaQ2V5xeyXzZzTAvy+hG0A
	1v5jyK35bYB5wSNp6j4Ih3a9sEyXFJCmvanB8rdHJT6IDrOWNzrIBrEeBKhdCO6slqoqGufC2s/
	dvaeTkMZC51aR5YaXIZ2AWgtkWPI7WAAMfHkLo4EdyDoy6AliswQhcn4VP3mb6nZi5Ehjw75vyN
	U8M2SD9ULDUHo8o7ghKlLRCBlVWRMPXZFFbZegfDPqAuMHa0kYZijWpaAoFRhOOUQ0QRLeHBfe+
	6U8keo4bUGOrCWrOOezcdIj637of0Wi6SCWG70FC7zmp2VPiWaD/RCcyOOCeYL4VA6Jhh32OJt7
	WhXAzTinuDJmKVN+8aOL9hGD7e+6BVNigvfdOShJPJjKtEG/y0xMfJlh/fJ4zqzXTCevwlMzNPG
	rOfgGs42hB6f+mKoW2QhVOGITAAo5al1rRvxvZALV/X9cVJKCXp8M0Z8gYc5+w3M/tt4vPw79wx
	OSv8Sj1sw==
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr366018625e9.5.1788167604540;
        Mon, 31 Aug 2026 02:13:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm320935205e9.14.2026.08.31.02.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:13:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/3] ASoC: qcom: allow SM[456]50 HDK board to play audio
 via I2S
Date: Mon, 31 Aug 2026 11:13:18 +0200
Message-Id: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9FlWoC/43NzW6DMBAE4FeJfM5WZm0IyanvUfWwXZaw+cGRT
 RFVxLvXpIcmqhT1ONLMN1eTJKoks1tdTZRRk4Y+B79eGe6o3wtok7NBi5XdYA1DuChDOtdTaaG
 XaYCuOYJigqqpHGMpLMQm7y9RWp1u9tv7T06fHwfhYQGXRqdpCPHrdj4WS+8/P2MBFtBtHdlWP
 NH29aQ9xfAS4t4sRyPeUa54RmGmPHJBLFISNn8o90vVtnxGuUzZDVW+duydbR+oeZ6/AesSADF
 rAQAA
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RCLDTEg9lmjDKChkil90PiGZqmrbszJN9ZdDp2YVeWc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlUWxU1zZQV+qv2kHIxq/tBq1L7cUoFA6Gu99JA4/
 zj0RObqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapVFsQAKCRB33NvayMhJ0Z2TD/
 46D0cIjXwOgicJGnkPcOvsRq5mVpW1dv08qJ6aNOHzhC82IuiDaer7q541PkgjPLVAx8qKfb8iBVKo
 Dd8rEvUxVBK0y1qgq31k/KJP7qdoag3P0ti9GpsQeCq4ninNyVscchi9B5UldCEW9A+4efyM5BkOgW
 WZ065tL1MwSktbYXYgakMBHLLUGGBZC/M3MXijsL2lj3QSndYjF/suwDQ0BLSfBr3bQrIrtXx2yTrR
 qG1ww7x0SM+uzW08BI/lbmBzBf2IeC8F/3w8impLEbBVtRhjDVSJ5P37gAyGd84omMBO1tyWqnVjrK
 IQlZ7WKHakbwj7KD73pYKGvTIDsIj4l0xftqLoWNjORVL5cRF0wokdouSx8aHB9q4k0CY0/on5YSb3
 OHurNMQO5sBT+IJadG+nOiKH2RZxkBva2iKrFJKgkBbkW60ckcbK8H3AlcuCgMa1A88dWPHsqsX271
 OajEAeZ7MimpGjncVPg+Lei7qhyuL7/2/bez3k0LcVzvglswTcRDVlH4xGxO3+anFgFlmxAzXYErlk
 v5VM7N0zIyshpVxXdciFNlCz4M0Q/0elxx44nLoBanVR17CHPgsqKh8iFAOQwd0XsoDPQwNRrcryqD
 wXYFkl7Uv5KZ12J2PlI4tnLNsOuT2hpKiDuI+85gER7qBsaDJnO5l0tl+x6Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merged v7.3-rc1

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Rebased on v7.3-rc1
- Link to v3: https://patch.msgid.link/20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org

Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
 6 files changed, 257 insertions(+), 3 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

