Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2BB48AE20;
	Mon, 31 Aug 2026 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198851; cv=none; b=oZ41YHLDmiDktQ3mkDw7M0PNrVOuQCYI7IITHgExHPGw6Ey58TkE0gRqW9s3SJQcajdG0+L5BaHAJHjiq4X808Ssh+hvSjyIRnmch/zvAeqD8gF05NLhE+TpkuDdQq6twdms/YdVuFYP9WZNOcm19UD6xF0QvrKQqcDrv4BU9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198851; c=relaxed/simple;
	bh=8G2pr7r/Mt494C9zOMzQ8wntLJWqX0LSXY0DmKiWGz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvXH6PqgIPhTlb4nETBTMygx0V7ebonYKx/hgmcmE70xtkN6rNw8WCjtpjMjTysZfEpIRY0FA0D9wVhlBkNXIwIADWG70FvfB+S+dBYCnzcj1ziuI5UEbMtfWW5CFM3llth9bhYzOYRHaJMza+7Pmro2k95/MJWPqw+wm3E7RZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEkDIYzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEkDIYzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD861F00A3D;
	Mon, 31 Aug 2026 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198850;
	bh=54I2GYM/pBMlUKMdjFU3UTU0ViSJEL5uVSLt6m5sxWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fEkDIYzW7t/VlHKXCdICcSVpkOaFmag1ClDfe+W4Ws+AkA1P6SsiCwTzRxrXE/Bob
	 aVdvyHVeRQJtyHlFawFi9IRy5PyHIpm5SJ5FW0fmsW4+Lkq26eoOv8+9PwpD0JOkNr
	 67Cu6e2vqgfHNmDkk2oWRi55QO3qpwHfS5euVVpORxuzaMFCIvjjMBTVlwPxc7cWku
	 TJd61VqYT2nF1xzAm7274NCLlRlIWQ2ccZ++pcBc+qVbEarb6SR62VoYl7l0C6qE+v
	 5pT8XCcKl6rroe1OeHdyRDWzEqxJYPDYFNSAAcsuU+oE9V7bDBsEDpgpKGw3N4BTYZ
	 oAJNe+emw7Etg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Flatten the USB node
Date: Mon, 31 Aug 2026 12:53:38 -0500
Message-ID: <178819882996.1411250.11548628579035712190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
References: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 14:37:16 +0200, Konrad Dybcio wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: agatti: Flatten the USB node
      commit: a5b9a226e432cda4c5f8ff421566905cc758be9a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
