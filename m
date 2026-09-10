Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870749BD76;
	Thu, 10 Sep 2026 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047242; cv=none; b=TyWQAcbVpKGT6ZTPPhq5RIN8kv8vG9k6AdU/SDqNPiNEQYG/snnxc+q1YzxC6P7hCWW6fs0LMjUH2ocaFhv+jOtGFJP2L+HAgmjV2u5/+qnAwVs55VbdrB+yyPN6PYT8NTjHVHoIwNQM/k+PUbsxUigqOnf2intp8hQazfijnc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047242; c=relaxed/simple;
	bh=t7byW3P9rB0/8h5bokdTjBOdLnO9vpmtfkIPCwMNsyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hBGRWihFgtEEKBKNzbfZf/SaeCSZxZIsKvjpMYAKzZr1JeTFCv/0p34AN+D5zsjKxvGwTEyZ7QVazhHAJzpNt7ZxLfMGsy2AvEqbGaDNiRKyB0cyEZpmTql62cEXpMjqDWRk6vh6c5T5BYQWMUPxJRNHxI08Y9zDHDVnc+B+f10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAzvd13o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAzvd13o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33A81F000FF;
	Thu, 10 Sep 2026 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047241;
	bh=mVpZRwmPYTYh5WFk7j13BKDEXaqfu2gQ51OXyOnPMQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WAzvd13oU6IxRf7u/6OwB8llqJs0ovIDnShar3KrfK2xaF1gxwVHXsAwxroymNf6j
	 Fu57kOV6gdNU03+qItKz5u/1iURTXJfonV6w0uLP89R3LEdfPjOWnNsBqEYVq5a5Cd
	 vA8cLMmTTDuV5UIPhurpBbnziK3e+yV5jKFmHDg30KNRDKAOkV1kwzuxZKEWkn8g4E
	 GWEnv0wjByhrsc1wFQ26pp751K0N3fWk7h00ZSLnclOB2JOALhuxj9ddCWHII3MTrE
	 GoaMbvcRNRk0YBbYKtnCwZ99FcuH8c1L08P6kwhnIUxcQyAoj6UlAj8n79vdMqmDRp
	 Gvznr07dqhIeQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dhruvin Rajpura <drajpura@qti.qualcomm.com>
In-Reply-To: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
References: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMAU0102
Message-Id: <178904723838.1148982.7064386673959350539.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:33:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 30 Aug 2026 11:47:19 +0800, Shawn Guo wrote:
> Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
      commit: 774225ebecc2e052b1296a0635026e2cef0d55ca

--
Lee Jones [李琼斯]

