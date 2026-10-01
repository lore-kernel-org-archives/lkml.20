Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4C51EE03;
	Thu,  1 Oct 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865574; cv=none; b=C+dXbPe+6swReuvC/c/VZEGZBX3JsNIJGRGXi21q3JfaiPjNU1ye9mKTLIxBz+DxTsEVoMNliYuh5pQpGTMSrJQyeZuV4twI/TUEvm2wM71T1TXO8CBEpNjaWeYqjjQ4ACRf9AiN/sg4frehJaTQvSScAJaDCR1xofx87Jvm/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865574; c=relaxed/simple;
	bh=JQAtUIzeWg+aZssBONkqABi0SEevUI5obtHpIq9Xdck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlfVskp0AkjlEg2iCMkfF1tdnkUs7tdTOymreE2KJ7BYrMTJNwDx3xD+IYfxsz7MfNtL2rwcDCMrl4KREHvV1y8bFihyIiGr0t/bkYKWxov8/TKI6tMH178dPpiGan4e0AgSQ3dav4gKtN8WQF7eO0ATod2uSOw08wkSgCbcggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mo1UZrow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mo1UZrow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00A51F000FF;
	Thu,  1 Oct 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865564;
	bh=JvYwY27KDFWebo51DpHXVxF3Qmvyl/paYjmbu+YiGic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mo1UZrowXfZDjWQYwWq/4TYlMoVpVy7cg7vZrJ71DzuI96LF9SmRo36DEALtPGSdy
	 yvhikNdOSr/GeH7Oy6iwjrejApRo509keHsL2smfv4QwzQcjvyd7pdDuwd+LuGLt2o
	 8UCKsAApMXkIWA//DMtKB0/anh/n1sxhtQv4f/8agEs7rr9gk85swDuZQDDtWhDca+
	 7p35oQyh5AJzuK/DMtkEnbDhe5B9oJpxCDifi2TWdDChhbJ4ZqSpDPchoXsJt1bXLH
	 cF5EfBv2zn4S+wuSTaT+5+IqWtmwV493Ffbnsy9b+vJpIGmw+/qZx1utgSXGrMEGzU
	 hv9AV0H/E7Gwg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on primary controller
Date: Thu,  1 Oct 2026 09:39:08 -0500
Message-ID: <179086552992.3495936.9539167152099544435.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
References: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Aug 2026 14:35:26 +0530, Krishna Kurapati wrote:
> On Shikra CQS/CQM platforms, usb role switching and Type-C orientation
> switching for primary usb controller is handled by PM4125. Enable the
> PM4125 Typec node and add remote endpoints appropriately.

Applied, thanks!

[1/1] arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on primary controller
      commit: 7086cc13810b9f68257c40cfd1abbb675ea381e9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
