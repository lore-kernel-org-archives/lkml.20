Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549310;
	b=UmgDhdTSSiH/Qi7tYyL+F+c7KrUV0R/27dsdmoGOPYOQLp+zCKL7GRW7XJuO1GYjhPLx
	 9Dff0weGaYIpyH3nZwHY6vitxTotZw+T2id0P6XumJHJhhnC3gHip3W4XBC7luIpM86Vv
	 BwAjIN4Lp4AcXI2WZU0A6ivi6OfynHDmZubEHxtefU02glom8AYtPe7MuaJHdxU/GtYg2
	 cfJouJ3YyPvmlAV448EZYDxdDrW1yyqV//j6apzuZKzx5RYsVUDRZye3dlGU9dKCYHdK+
	 2EeuKkdcWNrMlckpGP/RgcUIvqeHcRnKwFmBggw7jB0LSqXAxr12wVz608ijCdw5ZxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549310;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=oVvtiBusAQ8x+kZNnvGDY5KfIHpl0LwCSf6F6ycRMGc=;
	b=FLdQOkKAojikQyEgjFg8qEX3kue2HIp4HL3BJK+tfB4zqIiV8Gq49I0J34eNpCLTgOwV
	 wEp+EFnc5TwtAFnwFwT0J+qLLuiDnJixlx4UGAWvI71B9E+cS0rUOOFRgAmQOUxZb8yoj
	 nr3WoDXAlXVlabBvZ0KFE2m69Sy6J614bBP9k9Vgmm8x8Vn3Ub0vi/fq94WPwKua22jkm
	 2DGbRWq3PB4W5tEwyas2u95l3KcKdHRFVBEf6wbgUNFAlTrOc5V4itrkfFqajnLeZhYB6
	 fVUKFj/2T+P0DaXxtcOEzadjCac2WctJV1/JsPOSnnr0rz74Scuywm83fmBN2f9z1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=ADYaOGiN;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4AD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=ADYaOGiN
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B26810A27C;
	Wed, 21 Oct 2026 04:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792549301;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=oVvtiBusAQ8x+kZNnvGDY5KfIHpl0LwCSf6F6ycRMGc=;
	b=ADYaOGiNy2rEJhjqw/oaY9tBQvgNCeusk8K98oDu6mqNyjK54TYP5CF+I1RJ372wKctnp0
	PW8dJMG1lVFAMZoHcRzLgBQRXaJyTAPgsxD7lflOm3LbSezN41YG/H5ZPXWfeHPo/kw2ew
	D1B+ejiPYgjj4MjxVWTQHslqIcdXoIk3CoQwKnRkXO9AGBE/IZ/LGSXlg/CucsZNM5ypcl
	QtGEvg1TpdlPJMy+abD/OK3LjCWy886M/Z7ITMHbsW3i91cQ0GM7aaUYMvwkNwhOAqXUdm
	jApswH0Hp0NzPLf7goFrRKOljlgWW7JCFn5FrDmEAenndLErku/PAKc+ZzcFLw==
Message-ID: <75174a84-13b6-4a97-b4bf-7513ee43ab69@nabladev.com>
Date: Wed, 21 Oct 2026 01:58:10 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
To: Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org
Cc: chengminglin@mxic.com.tw, mwalle@kernel.org, miquel.raynal@bootlin.com,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
References: <20260925014517.174496-1-marex@nabladev.com>
 <9bdd8b02469042ffa71851fd2641708e@infineon.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <9bdd8b02469042ffa71851fd2641708e@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/1/26 9:17 AM, Takahiro.Kuwano@infineon.com wrote:

Hello Kuwano-san,

I apologize for my late reply.

>> The MX25L51245G part has the same 4-BP locking mechanism as MX25L12805D.
>> Describe the locking support.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Cc: Pratyush Yadav <pratyush@kernel.org>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mtd@lists.infradead.org
>> ---
> 
> Can you test locking as described in [1] and provide test log?
> 
>>   drivers/mtd/spi-nor/macronix.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index b3fdb4b2fa1ca..4de1b490b16b6 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -165,6 +165,7 @@ static const struct flash_info macronix_nor_parts[] = {
>>          }, {
>>                  /* MX25L51245G, MX25L51273G, MX66L51235F */
>>                  .id = SNOR_ID(0xc2, 0x20, 0x1a),
>> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
> 
> According to datasheets [2][3][4], those chips have TB bit in Configuration
> Register bit-3 and the bit is OTP.

Yikes, that is correct and also scary.

> The existing HAS_TB and HAS_TB_SR_BIT6
> flags don't work as they expect non-OTP bit in Status Register.
> Just supporting top area protection (TB==0) would be fine with me, but in
> that case, fixup should check TB and activate locking only when TB==0.

I came up with this addition, is this what you have in mind ?

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9aad2..1539ff3ed404e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -15,6 +15,9 @@
  #define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
  #define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */

+#define MX25L51245G_OP_RDCR	0x15
+#define MX25L51245G_CR_TB	BIT(3)
+
  /* Convert dummy cycles to bit pattern */
  #define MXIC_NOR_REG_DC(p) \
  	((20 - (p)) >> 1)
@@ -45,6 +48,52 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
  	return 0;
  }

+static int mx25l51245_read_cr(struct spi_nor *nor, u8 *cr)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(MX25L51245G_OP_RDCR, 0),
+						  SPI_MEM_OP_NO_ADDR, SPI_MEM_OP_NO_DUMMY,
+						  SPI_MEM_OP_DATA_IN(1, cr, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_read_reg(nor, MX25L51245G_OP_RDCR, cr, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading CR\n", ret);
+
+	return ret;
+}
+
+static int
+mx25l51245_post_bfpt_fixups(struct spi_nor *nor,
+			    const struct sfdp_parameter_header *bfpt_header,
+			    const struct sfdp_bfpt *bfpt)
+{
+	int ret;
+
+	ret = mx25l51245_read_cr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	/*
+	 * MX25L51245G supports locking, but the CR register TB bit is OTP.
+	 * Enable locking only in case the TB bit is not programmed, or set
+	 * to 0.
+	 */
+	if (nor->bouncebuf[0] & MX25L51245G_CR_TB)
+		dev_dbg(nor->dev, "CR TB is set, bottom protection not supported\n");
+	else
+		nor->flags |= SNOR_F_HAS_LOCK | SNOR_F_HAS_4BIT_BP;
+
+	return 0;
+}
+
  static int
  macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
  {
@@ -89,6 +139,7 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
  };

  static const struct spi_nor_fixups macronix_qpp4b_fixups = {
+	.post_bfpt = mx25l51245_post_bfpt_fixups,
  	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
  };

Which led to this locking log:

"
+ mktemp -d
+ cd /tmp/tmp.45Mtr7ceEE
+ cat /sys/bus/spi/devices/spi2.0/spi-nor/jedec_id
c2201a
+ cat /sys/bus/spi/devices/spi2.0/spi-nor/manufacturer
macronix
+ xxd -p /sys/bus/spi/devices/spi2.0/spi-nor/sfdp
53464450060102ff00060110300000ffc2000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520fbffffffff1f44eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffd649c50081df
04e34403673830b030b0f7bdd55c4a9e29fff050f985ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff7fefffff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279df9c06485cbffffffffffff
+ cat /sys/kernel/debug/spi-nor/spi2.0/capabilities
Supported read modes by the flash
  1S-1S-1S
   opcode        0x13
   mode cycles   0
   dummy cycles  0
  1S-1S-2S
   opcode        0x3c
   mode cycles   0
   dummy cycles  8
  1S-2S-2S
   opcode        0xbc
   mode cycles   0
   dummy cycles  4
  1S-1S-4S
   opcode        0x6c
   mode cycles   0
   dummy cycles  8
  1S-4S-4S
   opcode        0xec
   mode cycles   2
   dummy cycles  4
  4S-4S-4S
   opcode        0xec
   mode cycles   2
   dummy cycles  4

Supported page program modes by the flash
  1S-1S-1S
   opcode        0x12
  1S-1S-4S
   opcode        0x34
  1S-4S-4S
   opcode        0x3e
+ cat /sys/kernel/debug/spi-nor/spi2.0/params
name            (null)
id              c2 20 1a c2 20 1a
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | SOFT_RESET

opcodes
  read           0xec
   dummy cycles  6
  erase          0x21
  program        0x3e
  8D extension   none

protocols
  read           1S-4S-4S
  write          1S-4S-4S
  register       1S-1S-1S

erase commands
  21 (4.00 KiB) [1]
  5c (32.0 KiB) [2]
  dc (64.0 KiB) [3]
  c7 (64.0 MiB)

sector map
  region (in hex)   | erase mask | overlaid
  ------------------+------------+----------
  00000000-03ffffff |     [ 1  ] | no
+ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0514406 s, 40.8 MB/s
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_read
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_read
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_test
+ grep -A4 locked sectors /sys/kernel/debug/spi-nor/spi2.0/params
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_read
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_test
+ dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.051125 s, 41.0 MB/s
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_read
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_read2
fa5dea0c7a85ed0bc865bd0b6ed09e2aef41bb336d9805a93bcfbbd26004ea7a  spi_test
eed3b73016802a59982c74a45ce96deafb7cd486cc5cd831e030239c0ddeb8cc  spi_test2
+ grep -A4 locked sectors /sys/kernel/debug/spi-nor/spi2.0/params
+ flash_lock -u /dev/mtd0
"

