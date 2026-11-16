Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833985;
	b=jdWJCfCE7W/EmlLBvkRHIV1R8WTM/NfTm2+1xgO5cbGNVhbX171N58y6GnKS5sdAErXS
	 8ZxwdKRv6ZevE0jAc3+0Jszp59lxZFsY/EaHi4HwS7Fy/EfdJ8lwqFNeS5oHiRZgS8rmq
	 VETJHpwxe032pe54Va5tJLWl1SVTfZnILNoY76PcAHOGvVDedkXZRh25A+QV9xFi1utWz
	 N5eGWiY4nKWVIOb6PYSZ2kw0TvqjDivtHmqU+ZENRALpu28Jl6CZbb8IJHmgGWKU+72DW
	 EXPatYF1Co69F7G3sl2XwO5Y3ZWN2wocE6O5ImTK9Cc0gd0kVYESh3NPq94mrRIkI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
	b=M0F9Nd+1SRId7CyLcrqCOgd/oH1h0mSBmyWdQXBos8vlGdK/BV/9kdXEcN+mX6alJ6GL
	 4rGRrf3JW47bVBS/KcK+bgzwqmbrlte/unBq8MczKsmITkFQLPqJuBgJmQTzmu2stLDSC
	 F293k+zCSmwSO6vstQBl6hMz4uyyCwq+GaN9MM4MwQWc0od8YXElXThyhLTKvunSuBME3
	 +BOgvjV15nxaw4DqcvaVPo+UXyds4VZGf/nqZ6Mr/71u63vhp3rBWW0yGquTEKIgmpCdb
	 GjgYnVCvaT+XYgmv85bntaWpUSMymYvJDlnu9SxOd6X7IkWM4IbUCZ47aIDc8fSs7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9gPU+Cy;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4E606A880
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D4E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9gPU+Cy
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so10481815e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833983; x=1795438783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
        b=D9gPU+CyjJQ6g+iJIUplUYc2NJyLCwP/xrnG9ifrsvPZM8auQZpcDpMeMePZsImhPx
         uch0qXkdu9GGb3N7/uULQRL+Q8eSB1ZxgT95QxupeXT4QTetsnuv7zarGytHzVgEsrRj
         7wdmq7MZ++aZ/9O+sqsfDbTZQmBHTM+Sgm5tNCXUAE5B+bv6eZjRHNfOlI7C7B5Nzfsu
         uLrzBPObBZcwyy6cjzJFuXhVDYxGhEp8V/GTKstbJSMNBbdhcwLUv/Kq2v5aw/9ehM/g
         Nu68huMWr/T3MwiIAkRsdd01eJWAOyXozTy2dxrTyQUyVnIKpMqH4XzKtmJbTvkc0O/q
         2tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833983; x=1795438783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
        b=lWdxCWl72BF3kaWDoGo8MPCPlpmY7gXEY8X9oYCt8hxFaoOZ9AOvJb3O8TDxgLL6MW
         ykVRklvRgA8xeiELeaqdeUBYFXd1DBng16GZUecN0So7cJwGlhoEMYHred/mSEAJVRNe
         irWbyuwddlqTKkhxXR0UU7xmivSK4ApZ5suVf9VrE2JB7182LvxGZOv8CdRXIsWiD2XJ
         1aWdqaP+TrdcHV1MiASY3FQxMq0udh9V8nf5Dc2TqknrxzvOX23o1y7Zp1H2Jqm6M/Wl
         uRlRIE/y7wQUuQpdo+bNP+vsymhoqDRihhp7ZEkrCUME+G9YRh7RqPXnKWru6NvNA91j
         jDXA==
X-Forwarded-Encrypted: i=1; AL+hErE5dMTNG6EhM4EagY6cg6t8Ht19TTsr11Ru9MnHnNfOXMU9I9J2Uy4FlZI/ihRidAWmJ1m7bR91e5IwLrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nYeK2sOhJD7jYIK47gUJK/8OFUz/zqVy5cfYF0dSYa67E5sO9
	NGdjGdZxlQPmoi5UnCN2ev7YXOetl7tmS49YXRi3CVP45Rs24U4sATkW
X-Gm-Gg: AYBFou1dPAQh9EIsXYPTFoqBQT23oks4P4GTlDHoc9fwO+ozSVMFm9hhlo+mIqOmH0L
	6Cxb/rsScv0EUwV0RigXdW8L1PbxvUegIoJTWK7x5adE/HJHvXux1FsdCBoO8j6aP8MOP8g1NgS
	8vDec8Z/XmQmvPiqP/hINmAkDhkhFZMXF/7zqEFa4EsUjRGSs6A47H2vE8zPcV3PMZL/Jq8dpmn
	OC6cPWd/6RvJ7UxqUTmB4MZ2deoImlUtY8cQD9XCcQ9tzokznTj8HCAMx/HYc2dZTYAOjtsF1wB
	xQxS7M74SMOsqV1rCQBL/MEU4u4x6Q04VFV1gxaImglS5NRfFrezvGMTRinibYF9Wh2NUuipuXG
	xHiz2pPb4hQZ12YjCc2u7ZSRABzQt2mTPEqCf+a6VNC8AXodJ+cLWQM+RxUDGv340XRecAkeN7U
	0Wz6+Qb0UW2nAPdAYnVq/EV3/+XYyr6R1bT0S3wjim1qOMSYHdWDFhWlOBSVb+PnWI1tPFDO2kX
	vVBX/lg7NQFpeLjcWG+NHprQTusLigHOWxLBWRWHx37uhQFWmReg68wgCKOlped0AMgop9QSgcU
	m1mXHDP1ysuTqONwelM0DGyo01tAolmvI7E=
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr231511055e9.12.1794833982968;
        Mon, 16 Nov 2026 04:59:42 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm205471805e9.14.2026.11.16.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:59:42 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: keep the error of a failed read
Date: Mon, 16 Nov 2026 13:59:40 +0100
Message-ID: <20261116125940.1368194-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When the count byte of an SMBus block read is larger than
I2C_SMBUS_BLOCK_MAX, i2c_imx_isr_read_block_data_len() sets -EPROTO and
fails the read. The read of I2DR that took the count byte has started
the reception of one more byte, and its interrupt comes in while the
state is IMX_I2C_STATE_FAILED. i2c_imx_master_isr() has no case for
that state, so the default case replaces -EPROTO with -EINVAL.

Ignore interrupts in IMX_I2C_STATE_FAILED so that the first error is
returned.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read" and
    "i2c: imx: do not acknowledge the last byte of a block read of one
    byte", with the M41T0 RTC at 0x68. A test-only hook passed the messages
    that i2c_smbus_xfer_emulated() builds for a block read to the adapter,
    alone and followed by a one byte read. Register 0x03 (0xae) as count
    byte: without the patch -EINVAL 40 of 40, and a print in the default
    case showed state IMX_I2C_STATE_FAILED with -EPROTO each time; with it
    -EPROTO 100 of 100, as the atomic read returns. Count bytes of 0, 1 and
    0x13 read the same bytes as before, and the bus works after each
    failed read.

 drivers/i2c/busses/i2c-imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..c7fef98934d4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1142,6 +1142,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 		wake_up(&i2c_imx->queue);
 		break;
 
+	case IMX_I2C_STATE_FAILED:
+		break;
+
 	default:
 		i2c_imx->i2csr = status;
 		i2c_imx->state = IMX_I2C_STATE_FAILED;

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

