Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633482;
	b=BEsqeNNgHdIEkTWsGfZ5YE7nPpdNKukBKIsHY/2HpasJ8TW5plv20Hgdfw25uf1ntDWA
	 C5syQldvwNIiFHud7uc8ZUNfQHjYVgkksFbSEq4adgeDuSYiK3JGCv9ifuMlCDGysY9aM
	 ZtsCxQokTYU2qGxHwM33OleYKQMZ2yz7BBc0k2iU+ftimyAyMeybX+XnGUpzugYbE5Eo4
	 zFE67vmtD8JSgMnRjItCWaSM8g4luFXCmuxEllnCMpid1lU0+DswFUw/lYEzRskCrLN/L
	 BMdkDtq756UNr2laHumC9trXYHYSghL1JzKWe9moQteeId7xi78RcnRHCUEZ9Wki13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633482;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=u8KlsjglqgYtj5jEusWZDtIHX8Luz8pZC9rBnXtmi0Q=;
	b=HvQGzumOvZTjJ4yZKAKA/r/OfY+Cs1gD2Sf58gOc+jK+BEdHXVw/74RFzYrKWro0ZD7G
	 7bKQIWEruXnf93CqJq+Oy1n36OYcfsmfPYSRWbLDVgXObU3IPNMP6h0IpMctdmxRik/8K
	 IeaqgtZKACcDeVSFT9Llb1pUk6VurmudmCaWJCBCjtUtZQZaRYQLU1fyMBYL2Qk3t+C8L
	 PEq4xu0wF85xtOsZw7A+wziMK80j1IxIHKWt3ohnS18ECPva8CiOqq4fmeP91TL8XaTRa
	 KFGlSpp9odIr6rYcrLQ4ZpFzQXhb8IkrOMmoSmM2w0T+5B+EOQ41usGF4tu975VEO4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J/qdmox2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A8609EE42;
	Mon,  2 Nov 2026 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J/qdmox2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E461F00A16;
	Mon,  2 Nov 2026 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633481;
	bh=u8KlsjglqgYtj5jEusWZDtIHX8Luz8pZC9rBnXtmi0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J/qdmox2eqXEWCv5XUEJQx37Od8nU1wMi0Bc2C9mCDhL88i+zSzGRbVihYHiqXLOa
	 g3Dfo9QA3MmH8rJNsoNOBBbat/liFHRZjNV0muYx/wuyAamwIzOyboc3aQNaG1Fpv8
	 CmJopb7QZVW9mKI6nlkx20lP84DZ5fMfWgfMcc/AI5kSYQRWOuRQQg5tcF0Lr3Tl80
	 VdxnogL31pZlj1Yewi0W5WJbAPBZ9GMUQ04l04+KJsZqsHB1JLWdWFTUfHrUXUb2oY
	 YJsgjEm1zbOnFDa1ShHicpDP/KBYRVUkIqSzwe1OoQoIbz+p5Ql702WWJKb9ZbqBCU
	 MBom5HcpX+00A==
From: Thorsten Blum <blum@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Scott Wood <scottwood@freescale.com>,
	Stephen Chivers <schivers@mandarin.aust.csc.com>
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 1/6] powerpc: dts: mvme5100: Drop #interrupt-cells from ISA node
Date: Mon,  2 Nov 2026 16:29:59 +0100
Message-ID: <20261102152957.300019-9-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102152957.300019-8-blum@kernel.org>
References: <20261102152957.300019-8-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=blum@kernel.org; h=from:subject; bh=k9cmxF3STQ+7TVeFgrQyaw4gu4MlGxo9bPzSio1vBok=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1tSoZE30EfxuI5r0fUniiW3Psyw2LWBlLdhyK7jfu 3/Xu5gjHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjAR4zCG//W39E1+H4s3/c3q enbbm85ValOO3ue01Gx6Fja9Okp69RGG/04mf1V2R5Y3N0TYHdx/4Pa389NMQv3XzYs7VbmJ4ZP YFXYA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The ISA node does not provide interrupts. Its interrupt-parent property
points to the i8259 controller, which already defines #interrupt-cells.

Remove the #interrupt-cells property from the ISA node to fix the
following dtc warning:

  Warning (interrupt_provider): /pci@feff0000/isa:
    '#interrupt-cells' found, but node is not an interrupt provider

Fixes: be2019816e4d ("powerpc/embedded6xx: Add support for Motorola/Emerson MVME5100")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/boot/dts/mvme5100.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/mvme5100.dts b/arch/powerpc/boot/dts/mvme5100.dts
index a7eb6d25903d..b7e97d56c324 100644
--- a/arch/powerpc/boot/dts/mvme5100.dts
+++ b/arch/powerpc/boot/dts/mvme5100.dts
@@ -155,7 +155,6 @@ pci0: pci@feff0000 {
 		isa {
 			#address-cells = <2>;
 			#size-cells = <1>;
-			#interrupt-cells = <2>;
 			device_type = "isa";
 			compatible = "isa";
 			ranges = <0x00000001 0 0x01000000 0 0x00000000 0x00001000>;
