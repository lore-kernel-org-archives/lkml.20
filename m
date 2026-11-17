Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892906;
	b=RU+dY9s7qqwSBIfU+USj/eFJiyN8CENlpxTg2yoBXKde+37f+fA4oXGr6V1h0CVDgEPF
	 aSYs8W0TRPzwVJLDvPu8+AYqSvwP9upJ2FJCPtJAZkiXnVR/8sMIJMxJ9z6ahW8SFdASr
	 D7GaZ87TbFbzs/Tj80pnXbe6RWLTvHh5nSLgsMEBQ+pyWf2MxKOQmlJ/ZWdgWxJLMXa7g
	 LD0Xagu2YFSdhDa5svQfi5pRSkYiZusSmfio4IDhN2qAmGO+3gJcKPkCRd/xo+WtOtOHD
	 cSToqR7IN2WdrEudU/htJy4jk0yatm5NaG/g5qtaVZ7hOIcdVRDEo31Xm/tXPP+RTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892906;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=krgrkaUByJzPx3Oep9kE1eLlOU2CuLnu8dGhiIZGvXs=;
	b=x5vRqCm9DThidUbD/BpYojU/MrE020DUCDIwIj8zVaRmLNUh1/CuG6UGgGJlwUtUoRVy
	 +PeumIHnmwgs7iVswi2MJfvM6hpoVDApJkMTjXU6J0j6JVyIZre6B5S1I9ayvPE5SRGon
	 bauEPbcLw5A1R9fh35YUqediFk1jnGiBcKgBByrOhv8UQ0118/h7ouWHICsZzAr3/TKVh
	 5gn+JhWG37iF9SkBLCbJpq+UYYx+QIzvX67RZrLYpKVCb3CkpP0FzV9bwDa1vcbHhUJ6Y
	 9SrVMAJFehzrYL8TLfpPYo5of4YFiH5N45FIzJ1CzS4zcuk73qr4jJyiHbZiVZcBN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=yPWePl3f;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A284606A330;
	Tue, 17 Nov 2026 05:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A284606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=yPWePl3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=krgrkaUByJ
	zPx3Oep9kE1eLlOU2CuLnu8dGhiIZGvXs=; b=yPWePl3fpNZct3V7POi5qFoR56
	F2Dr/QpTF7TKSDKC/cKcNXlPV3oX6Wq6x5gE5wsV4I4LXXioTk3jWSvqSZHXFO2o
	DjbVn0B9GhGFhOdEG077VUmgVHSI3FXThLsKcEPL6586ADS9tZhG3+hxfw4fwTxK
	JNXWw3Npb4bJK0j+E=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.190.181])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHBjth5Ptq2kLLAA--.1660S2;
	Tue, 17 Nov 2026 13:21:38 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/3] usb: dwc3: support two connectors sharing one HS data bus
Date: Tue, 17 Nov 2026 13:21:34 +0800
Message-ID: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:3pYKCgCHBjth5Ptq2kLLAA--.1660S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWrXr17KrW8KrWfCr45KFg_yoW8GryUpa
	y3tw4ay3Z0yFWrXF1fJw18Xw1fZFs3XF9rt3Z5C34UAw4Sgw48urZaqw4rZFW7Gryvgasr
	Zas8Wa93K3Zak3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07b59N-UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2r7WdojVwAhse

Changes since v8 (Rob Herring, 2026-11-10, on the cover):
- dt-bindings: the two connectors are two mux'ed data streams of one
  High Speed bus, so port@0 now carries two endpoints and the second
  High Speed port (port@2) is gone.
- dt-bindings: the private "port-select-gpios" property is replaced by
  a phandle to a mux controller ("mux-controls"), e.g. a "gpio-mux".
- usb: dwc3: the shared data path is driven through the mux controller
  API (devm_mux_control_get() / mux_control_select()) instead of a raw
  GPIO.  mux_control_select() may sleep; it is only called from the
  mode worker, never from the role-switch callbacks.
- (board DTS is not part of this posting: port@0 gets two endpoints and the
  Lenovo Legion Y700 Gen 4 describes the mux on GPIO 29 in the separate board
  DTS series, because that file is not upstream yet.)

Note: the board-level DT change is posted with the "add Lenovo Legion Y700
Gen4" board DTS series ([PATCH v7]) so that every patch here applies to
mainline as-is.

Gate results (tree: 7.4-rc2 line, base f66469d9905b):
- checkpatch --strict: 0 errors / 0 warnings on all three patches.
- make dt_binding_check DT_SCHEMA_FILES=.../snps,dwc3-common.yaml: rc=0.
- CHECK_DTBS=y qcom/sm8750-lenovo-elden.dtb (with the schema): rc=0.
- drivers/usb/dwc3/ builds clean for arm64 with CONFIG_MULTIPLEXER=y.

