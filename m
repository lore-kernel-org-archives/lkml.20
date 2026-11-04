Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762823;
	b=E4uDRjdRtFP3lVFStdb67fZpZMLElr7lJj1DAcIaH9kJTCax62ghsfZRRf1KkP2xMRJj
	 dYvVjiH5W616mGhCKJf4k7fLrQsSDJdrUp/16Am68CGKu+cVLD5dxhrCG7cggipvSR9Jp
	 fuTSu+PxVhGD0AlScFc8dXCVD+9Dh4LGbOe3RGT/ngiev0JfVMjL9iAQSiqabVQ9bPdE7
	 njFG5Z1vcOYlFqNj2CDleZQ2ZSak+Fef0zOZrJbeoMxeuckrBC084/bUQxsBA2314ztg7
	 Lmw418ZXkNGoTpfJ2mvOhAVXYGuwM9EkPrsfH55ROX17WA97UoASLruAiF2kbIf3Pfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762823;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XvExC2+tWx5r3ogFdwkXOxMCwzM9eqisKqe+kdKim/4=;
	b=VzK9qbOB8o4V11lirNDa6Dvwg69y8wVtVJykSS/i3qwNWcK9dbEb75XUJ5PTxIhpPHfG
	 dvj9qyM0XelwbI6iKDY86sqhgxvD29ZwrBl+qw33rfDazAKQCA2LuVlJrjAD4QMhfsW3j
	 kS0gMW75OAXKlkj3Lah9ZUudez1BlnLKzTGzn6FXuwaiBX8yDBToSPLSqRt8MTn12T8oW
	 BvuyWLLzPVYpvPCH8BaiByI+ZNPkKeGqLevreSIKkQTnpb+Ia1Ul9lt64jDxUqky/4B+a
	 XqwACVT3KkDu2iqCsFOYLinQ8Tp8dEYERmY52oW0rowPObMIDuwdDTWhXc2p6y6bJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nDUNPJhI;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA760606A32D;
	Wed,  4 Nov 2026 03:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA760606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nDUNPJhI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=XvExC2+tWx5r3ogFdwkXOxMCwzM9eqisKq
	e+kdKim/4=; b=nDUNPJhI7ivH6jk0Nn77MQk1aMRnXd9S0ZlIBXMlefrx8mEjFW
	9QufHXHK6X7jkQFLA6Dy6yV3jYpQ6JroSwaUZtB1P8tvdz8472H4UrAbvui2wGrG
	+4fRGIbudYp+O6XUfRHk3Qn3RNsUPvQAYgbeYT+EkMHFP3Q2iPvmSkgTA=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXnUH4pepqKzSAAA--.3770S5;
	Wed, 04 Nov 2026 11:26:55 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 3/5] dt-bindings: arm: qcom: document the Lenovo Legion Y700 Gen4
Date: Wed,  4 Nov 2026 11:26:46 +0800
Message-ID: <20261104032648.209747-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAXnUH4pepqKzSAAA--.3770S5
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1kAr18uFW5JrWxZw13Arb_yoW3XrgEya
	1xX3Wvgrs5AF1Fgrs0yws5t3W5Jws7Wrs7Awn0qFn2y3sFy398KFWkt34xAFy7ur47ur1f
	uF48Wr9IyanrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9xYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r1rM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxU45rcDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAfsM

The Lenovo Legion Y700 Gen4 is an SM8750 tablet that ships with the
lenovo,elden board compatible. Add it to the SM8750 section of the
Qualcomm board binding.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..a32cfb30a1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1220,6 +1220,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
-- 
2.53.0

