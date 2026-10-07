Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E424637F318;
	Wed,  7 Oct 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384191; cv=none; b=CLVxXbNzIYnF82ZyvoHicxb/JXFCtZrMlb72WAWhfL2qNw48po25+Vf/n7pwKDTQFhg31PAyBkbEGQfgXDPw431/M8Mol3BpL9XEnjt6N396vmp/pdNyuCju8rZEZ3h3wqz8n9qAc1RfBYvLst2Aqj79sBPqiSr/0KVZbqYE/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384191; c=relaxed/simple;
	bh=IKlFp3V5fb9Cq4emTxbQwZI3P8aNQUkKesrqU8OA1P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sm3ZNVpyuLnzG75S8tJkppa6e867d7oI+Gee5WAU3V33LWSm2hCewghFBHO5pGpMBelgPq5IvOqxNVMM5AS7p6h5NB2T5sDK0+u/vPOCBrBCcMVmS79FcHt1iZWtMPBxJ7qe/ECAMsFrW+wwGxJGV8v0maQ87XwtUQVpdDWavVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D19DlL2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D19DlL2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FCD1F00899;
	Wed,  7 Oct 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384182;
	bh=/n1lUVDvtISsTleobVdTsyOFDT6GSQkTBwpFcgRAnC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D19DlL2vkB4kKnw5dAaPXfrOq5sAnl9jZM4HXY7r2sKgr+j3y1VdssTZD84gNC4/g
	 Fx9A0Kn89atdHa51O7PDN37obJbG3F4am3TcPBAmYbdxqbUo5loXvDzPqf5ORq2134
	 N3UQND8+6/pLdehnQPrVxOvhpuqpyowiqi4XR4mpV2KBMBxiuXKZqHR6RImMNPj9Kg
	 3s3KMb71ejEX3pk2Yfn1m+pWkZ9GErAa4cq2NXvKqYAZzJzUeIik/ffQYny7TWB1kB
	 lozNx9q3D982Xptc8zeGkT3taKbiAGELHdImuvAVPj7rOPxFz6hpCq3yu09MySpS8q
	 DGv4pdfrdEJaw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
Date: Wed,  7 Oct 2026 15:42:54 +0100
Message-ID: <179138411339.612937.17423612061368525577.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005210506.2118052-2-robh@kernel.org>
References: <20261005210506.2118052-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 16:05:06 -0500, Rob Herring (Arm) wrote:
> The Arm Corstone1000-A320 has a GICv4 which means the redistributor
> region should be 4x256KB rather than 512KB. This issue didn't become
> apparent as SMP was disabled as a work-around in early versions of the
> FVP.

Applied to sudeep.holla/linux (for-next/juno/fixes), thanks!

[1/1] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
      https://git.kernel.org/sudeep.holla/c/5ac351938cae
-- 
Regards,
Sudeep

