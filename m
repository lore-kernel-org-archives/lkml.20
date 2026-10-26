Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008242;
	b=YAb2bKeh2BcAdnvmuZCzOptYSpylyXmuMOSMvDMPvzY9cfy5cdaFzFp849OwS7nDQn2+
	 reQdlBNaaw2cec+chQ47fu4YUUpMpXM7kZxCf7SrOtR+gV4EJY9+e0sshluSNSsqKb8Po
	 DleOLhfWQr953X7Ezody46m0cjMifxtHvJIBOSR2NLdzsFQem7N8tsspHRZ3I7ikWMJxb
	 Sw0sGJ1ewQcwTKgFH36eIKoXEkzPkbM7hz72jTPEd+jZuOrohDkEPZNu/5wnC8jIWTsQG
	 5ZNsA3lXUmFO/WMfY23kcteDCrX1k1C/g2HmW8u6/cI+cycRne6s5FdkwGCrRjLqmMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2/qEw4Q8zvU9ZQLyNTnQ35QU0eJNJDp7YOem/bIKsvw=;
	b=dLqyGyYrX3qFdKecr/D5njIX4xewHglHF0ffdk6xupbGNelYJVcnfbxca/g6j0OYb4Oz
	 5HqWTieoO01Wp30w5pTYCV0LdSLb5iecoEmu0RV5XyviWV7eD71nUHs4APITzDo906qu8
	 WyxWfaWOGc5pw+A9bPzVnRPN0NPIrGBnvjSD+n49Rt/4JcnYuRTNiEGR1RcDUypeMii9m
	 f6uISPPYJ8NJxKfc5lifavhbtUzSV6M1k9liPNGPxlyJbiRzrjhz2H9tPUk4LXtvlsU9g
	 AYumq2BW3lKq2kwDa8w6KrMPPRwNLjd3l/G4B/Ugpiq5euJOtXhShANdThSO4k0bGAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JGQm+0Ls;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A611606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A611606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JGQm+0Ls
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d1da913so2168535f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008240; x=1793613040; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2/qEw4Q8zvU9ZQLyNTnQ35QU0eJNJDp7YOem/bIKsvw=;
        b=JGQm+0LsjE557HWKhkgpTIGq8NZRQEXgnb22iQRrt3j0T9pWClsXeEHDTmweBKupAw
         OB4lwRE1tucXnssp85Z8Pv/d67RE9z9C+MRb8jQ7OYf7S6t42G0maSbGLGos6Y9+l18+
         mmy6O4V4J3BnwUF4PcGj8YxsD90CJqs7NXXzr2zhou7vDcbLyzc8wCzIEjUQKc/8yJpo
         mj/ljNls3yjXIUUDFuO46UMbevtdjogsZVUfHt67bV78T23oxd2dp3x7pEn6SU35pMER
         0HZreOwTR+PyxuTMmUrJJv/nt5Zgr5ERi2E8KJI0ggcvu2zEREDuY8zQ3FtY4sssofGs
         bZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008240; x=1793613040;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/qEw4Q8zvU9ZQLyNTnQ35QU0eJNJDp7YOem/bIKsvw=;
        b=GOGvvfe3iKK7/nyyZ7jHnJj7SSOXphlDFWfEUO96MAY2sEwfLPHwLqjQ17herzd+1+
         caFt6bmi98KYlFHvKwVxqtWlJP09LS2NyZw/EOPAofzLIeHiFeJM/iljvj2p2OWbU8Xb
         5IUgCmS448FGJomH6/5hrtNEnax2DopAPSRcTJcfrYlJvxyKebZGViQnVqB0LMUBif+P
         fIZkc2qpKKIPx5mn4joZbkvbqOhQeBL3SQdUy0a1V9sm58agQu7HgxxQnI7kYy3593oE
         pYOHY9XDGTIOwU9wsbC/odG6JKvYYgo+Z+5uhs2zPoS/3UaY4YGUDJXJ//M5Pe8J/b3L
         lD4g==
X-Forwarded-Encrypted: i=1; AKwUvByeqfrFhi0KeEkIIzDygSA8ghGaKv+dl/5bdehzr9lACdmQf1yXbL1JZ5Y3/TZ7JvWxa9VLY7OFJh5zt/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu8CAFS3cpWNI3Y9aevKz8+C895dSVvzWqK6lrlr4FjJ18IluN
	HD4bCi3z5QLuugEF9FdfehE2eCFGofphhJxPk+ncFAVEH/aYS9JRMao/uvVy+tjJmQs=
X-Gm-Gg: AYBFou0+RDP0YvvaMxli1xS/j+8UlIXmhbGNz7sSzD3Cleqmt8mhnR4y3UpTce3Wqq3
	EBo3++ud1pcUhAKGlne1Fx7xnixZPW+LLRd4QNcwWvEjEOzn6ETigSewd/UP7TFZBfOS+2h/fci
	0IzmUz84/mzFU9/md5cVyN2rrJ4JvhwdqW/6xDBUe2PAtrQAzHqC+nmifGRnEc40iUIvqlTZ3+D
	P9tt47gkIkhKZmwDtpQsRJ3orQp3ftHNpS0AfZ/Dg1kQ9awU/a3HLdUanJAhuz+MQ+90V1N/JnZ
	gEEYBVLt5BwxZlpOlElLsMKJl62FXZObPNgA+/WmTBw4hm6vhhQxzOQ75ruowQYxTvPuYq2fqBC
	x6oOm0tPgNsHE6axSGkgPN3QtLuuhz/JNkjdbBj2hFwDd4XDBzxtav0/b4HgNvr0Q00+LybdZls
	Qx/CKkNvUzytofGZrth6ZQIRvL8sgFZV26oKcWCaYsBQJvJbX+Tv6NE3Bm1MLrNYIHf4g8ivcir
	FRg6Oncm2vDzdJgy/WYTxP18DfmP67PPwedYowiFYlAduMMCZeF62elsLjIPIYplxW9ldc+wRSM
	XA==
X-Received: by 2002:a05:6000:29c6:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e3eb9836amr7414953f8f.30.1793008239426;
        Mon, 26 Oct 2026 02:50:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm15524019f8f.17.2026.10.26.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/3] arm64: dts: qcom: allow SM[456]50 HDK board to play
 audio via I2S
Date: Mon, 26 Oct 2026 10:50:35 +0100
Message-Id: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAGsi32oC/43P3UrEMBAF4FdZcm1kMvlp65XvIV6M6XQbdZslq
 aWy9N1NV9CVQvHywOQ7JxeROQXO4uFwEYmnkEMcSnB3B+F7Go4sQ1uyQEAHFdZyjOfgZT7VswU
 58DzKvn2TAbN0rdMeLXsmL8r7c+IuzFf76fk754+XV/bjCq4XfchjTJ/X8kmtd//pmZQEibrRB
 B0boubxPQyU4n1MR7EWTXhDabVHYaEMekWe2RK2G0r/UjXYPUoXCipyptbeaOg2lLmh9leZQhF
 i+VvZ3zXbVfaHUoC4R9mVIgUaqLJs3B9qWZYvs4bSLQECAAA=
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2576;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B7MILSCp6UA5vj4+o3nipg9IRcQy+2bwsNvR4RRnWIg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq3yJszfjZVaRJsrzIiFG+C6u+WgWr/1g8lUSVm9vn
 zd9Da2WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCat8ibAAKCRB33NvayMhJ0dDpD/
 9qvgiObhB+t5NKdXo4XcVgeCIkXP1xU6P32pBotSX/LEF6x1My5UGCqEa/PBkynJzB9TL/pcTza9Jl
 NUOw2jSpbTU6XD4yTW1SlHjQLjmZhWbVX/4naYwtTvsnlX2U5bPsa5mOAKZpBJY1/5n1bHiIIsUF1l
 Kez/cCjJjUWMpUgY/tK6VnBdRY/SPie8nT5Ve0FqSBdxWOyJvA1y+VPANI/dV/iBHcrh9jI4fRhC6R
 jjgjXnPlYXI+vhRrd1AWGP9MJ5+1+Fi3oNigyWmhdCk4+/TDQZv99buZTGrPjO/g4NJFdVvlKSBXKJ
 GnWJTgsLt55F2zu2c+8doG7h9A3lcBRXQQMNN9hLGayDdesdszZRI1q1OVhs0m/QRj1qmo5l2fOz7R
 Z0oedvKSkGnzgbUMyDB+NliIiAfJpVl43zwxl13/+GlJ47QDQKoUsNKHPFDtAHR18d9jVcBn29jc9w
 qOq3kHxD1p5FWS2jusnqg0CmFQtbYRX9X8jW3RSh2nkNg/Eu+qGBfDzgx6+0ntCIG1HizmdRBACWpY
 dI8LMdgi+CaG0Mx+GTH24d3uKWoeYtZjmYSTn+E00HRLlKKPQdT2K590XbCx6POHGjVndu5XSedCFG
 JbfVF+Y/6GkuXAw+YNMAqEIB1rcGSJj2ertTOoV975+eDjLqha2E7zRwbNow==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merged v7.3-rc1

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Handle the display-card overlay for SM8550/SM8650 HDKs by disabling the I2S DAI
- Collected reviews on patch 1
- Link to v5: https://patch.msgid.link/20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org

Changes in v5:
- Rebased on linux-next
- Link to v4: https://patch.msgid.link/20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org

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

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            | 36 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 40 ++++++++++++
 .../boot/dts/qcom/sm8550-hdk-display-card.dtso     |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 36 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 73 ++++++++++++++++++++++
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |  4 ++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 35 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 40 ++++++++++++
 8 files changed, 265 insertions(+), 3 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

