Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169361;
	b=FwdCDTVJGNZHScmlPQqPySKfEELmqg7ddkeWZxdQgx7k1HsjX6cIQxPceynoob7v0Abv
	 tbftbbU5/V18PzfcTEnRtfHQlr0tqE2AlRytDZsfj++LvPXH0fKwODK72EnWfdD09XiJD
	 vc73fYAo6u1DOB2m1+N/b4VcHG1a4Qb3s0p9912PlA4spIWqwlPQLHC5XRAfy4XwC0eRq
	 lw06nOVp8F8zNhxTSw6pdp4YngXbSkuhOxsfupuhNFQ1O6fk18s3L2YupufmpVIsc+ql/
	 k4zarCe/kYwv0zWGBdqqTOfDTdPgRoIsM3qZdaTzhkXO0zSBY7vt5jOqj5vNqtFfyNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169361;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z/NbxwDBC8S4zwnggIwfk2aysjV5PFuUQ0xjAWKysHA=;
	b=b/ZoW6xDgPj4fwNp8V2uo4TsTn2yG/ryxPVA1fvLlN596H4jUWwofu5lSf1oIOedHFre
	 wcfRdmXdMngngZMqlStNtvnO3B/eG129GGmF816eKl4Ru2UsM5yIzY6aCBUttZ0EBuEK1
	 Xq1g7lM9uq0UlZssxOHCo/vlsazlzEaqV/2El1J3liq1ek/lt56RA3jTiLJr3asoUqbxU
	 /5yOzXESACN6e5DKdJmIf5EbIEpH3+yx54QNdR3NxahvNPsI76ea4/7IvVoEXIP+Gu7F8
	 lR4q95B7k5bidU85zDi+ysbO7xDb3+PwQFlxuIcdXOj/Rv/FDr66NZyhFDXjonE6Dsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bM6CypXj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3F606A9E3;
	Sun,  8 Nov 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bM6CypXj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F331F0089F;
	Sun,  8 Nov 2026 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169361;
	bh=Z/NbxwDBC8S4zwnggIwfk2aysjV5PFuUQ0xjAWKysHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bM6CypXjfmfl7f9wgYiz7Db3DZR3GvYt4XDgF3sn/kHku+qNEubJ7D+ahzD8oi01U
	 S82mxVeL1KjGbJi1nmEcyBd+7bPl2AhAvuhYFtahluLwFBvFfhHs8FJYor3A5xzpIb
	 ssP+W+h0xQIS0Ot5LsVRi958JqemreJ+54cxXpCdtkUihDbrVPCobadBPsoymmBAcd
	 n1kRrRxsPUV7DCq5uQSwzPewcvcphd70dNdtqEVu/WotZxucQL+QJ88VYpikmI4aJE
	 ya7VkrPG65JPGRldVj6AsW9Cu5bbKYYsvJAArr3KYk4Tj0qzpYT+sj7IQFlFBJtqlN
	 GO58ddNYs9Dfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add passive polling-delay for gpuss thermal zones
Date: Sun,  8 Nov 2026 14:19:45 -0600
Message-ID: <179416929213.628393.4308310245068988723.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
References: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 10:53:39 +0530, Gaurav Kohli wrote:
> Introduce a passive polling delay to ensure more than one "passive"
> thermal point is considered when throttling the GPU thermal zones.

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: Add passive polling-delay for gpuss thermal zones
      commit: 242a566e70619d1df81ecfe788f63e2bbc032463

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
