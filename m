Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83004BD7AF;
	Thu, 15 Oct 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052456; cv=none; b=YT38ZKjcjUxhBNYSTkc0dMCIL4lsffHxi0YUPYI0ESVmf4B/jfMeVOnOuSP+k4M9IX6qMn26UGoDQ6xG4ZXPq9pw4207WdY/4kOJSdRI9qr+vmOGxdmPAgu59dQswb3v5+gCvDu9PJX+yTygyC3MVJYraBL5mB9R8jmwGQ052/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052456; c=relaxed/simple;
	bh=yMEzzua39wmuUbOFVUVMd/NR3qzwozugAAlXLdsCZSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCMiHRRdE2GOITHMlZQVik8B6ADsuT6kBdPKJeVV4itkAoFs0lBd7FzHKP/P3kNkNkHIniQMKT1b535KVe1YievvQLtTMJsFMmv8UfKHjz50gGkmOUsmupbXS4ooHeqiD/O2V8jslnryrAFGSMYoYg7MPGUKkdJ6ejhuUCV6s3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRP8bMx0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRP8bMx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DC51F000C5;
	Thu, 15 Oct 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052455;
	bh=6mXKenAul2pgscinfPY1MCJHdb6h6XxLACr+mAY7ybk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LRP8bMx0BcJBJnXM041eXZY+btqTsGp8Z9SGF/anYyy5Ag/ug662ti6pGjMPF2tMl
	 3FCV4zaScQhr30U5zM/4ApzZgBkOCN2bgmfwtPtMy2603iE8CC7ixcYxtTuZ5WC1le
	 Ix/0zXqWRcPs9Ne6rNavv+h8BQhCZD25S+FbFQnt91KC+QlG3rbMpIdRPBmqgccdO6
	 okzwpgmEQEvf+FEr5STvTqhJ+5tf33p7OKvxjlz2MFhgfzkzZA0UYZ8OUA75SFRp20
	 WWRVh8ADyTktUbfd+JDgzi31Nzt0MwNHoR48wJF6+ogILD53e6spHZNvKO8jXSmFC0
	 FDFDrsPSNRHdQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Oct 2026 10:20:25 +0200
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: gicv5: Relax IRS
 properties constraints
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2

An IRS is architecturally allowed to be stand-alone (ie with no direct
CPU connection).

Relax "cpus" and "arm,iaffids" properties constraints allowing a standalone
IRS configuration.

Fixes: 7d7299bd07c6 ("dt-bindings: interrupt-controller: Add Arm GICv5")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
I have not marked the patch for stable though I think it should go
to stable kernels to fix the original schema. I am a bit nervous about
making cpus and arm,iaffids optional but I don't think there is a way
to keep them required and force them to be empty for an IRS with
no CPU connection.
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
index 86ca7f3ac281..b901e4288816 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -120,13 +120,14 @@ patternProperties:
 
       cpus:
         description:
-          CPUs managed by the IRS.
+          CPUs managed by the IRS. Omit it if the IRS has no associated CPUs.
 
       arm,iaffids:
         $ref: /schemas/types.yaml#/definitions/uint16-array
         description:
           Interrupt AFFinity ID (IAFFID) associated with the CPU whose
           CPU node phandle is at the same index in the cpus array.
+          Omit it if the IRS has no associated CPUs.
 
     patternProperties:
       "^its@[0-9a-f]+$":
@@ -210,12 +211,14 @@ patternProperties:
           - reg
           - reg-names
 
+    dependencies:
+      cpus: [ "arm,iaffids" ]
+      arm,iaffids: [ cpus ]
+
     required:
       - compatible
       - reg
       - reg-names
-      - cpus
-      - arm,iaffids
 
 additionalProperties: false
 

-- 
2.53.0

