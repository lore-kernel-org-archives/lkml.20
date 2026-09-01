Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03A322A1C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231706; cv=none; b=T4JNbl5XCs6HGBd2N5/x1PMD15SlIVMwD1UCyqXReykmiL1++iiuwZJduDOMlWA+8YoukymQ9StYP6S7yCWFPFqzw2isa8M+6FDM7uCwGemVp3v+qD2sjpx2bSA96+s73JcCeWPN8WDltOJ1fMzTxCX2A4/MCifNyBf3DIX+PVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231706; c=relaxed/simple;
	bh=Hkef5vm62/D8cTKYlAkrlWuX7kZwXD/Ej6YpAUBO93g=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=HbkycB54DGHPgFVjywNjj86rVbGNJqo6fk7cdTDv63kwMz6V8HuqYIAxcXsKveU5i9gsL7+V9z3xfaybjHboJQj5Z0wLKexzso2cCPHN3eijB3ojwpdWXYvEo6UJI5m9IVxZ0hFut9f+PtDRr4h1HlU/dkoXYXffED9o4a0voLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grZeX0Eh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grZeX0Eh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so389977a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788231702; x=1788836502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyGWHCwFIJqwX2o4/R+Ah8t50K3KPyd4i+kW0IOiB4I=;
        b=grZeX0EhriUXhsJvTSLd1vhJ60qqtXImT1L0OGWt3npLHVJcnIf03Y3Pr8sBRFsgih
         SAyLeD8mBZaift6H9nKVmbNMRN/HX2R2wGEWLQnF0bL68HblJ7EUemWE392o6EF9OY5L
         tziLqRIQI0oJ0Rk1yaHx/vX/whI1f2UCHLaAwiq3HCt42YPUnp/l9ush4XHnpgtF5/+P
         0Zw8PPPhcQ1qMZnbzBbuRQtdm6Jnowg8zpCN879k3PTuGrI1VIctwWfe7y4SidgOXZz1
         As+ABFHec0FCsW38uxJ1GH4afXCxf63jaj9tqe/TRtVYvspsK46JEz5TeXGHKnSqjBD/
         PYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231702; x=1788836502;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyGWHCwFIJqwX2o4/R+Ah8t50K3KPyd4i+kW0IOiB4I=;
        b=kEk2P56GCOT3+5nFnh9sw6eJu1NxOt8M70LMs7dfoZ7kua68zlBGahECb8bad5CFuM
         Ws7vwM2fZLS8nywOw1LYM3svw7g0UxA75hRvt+7WC8Ag+64DLEOSOX/4abRLFvT9+iEW
         5q4fCexhl/QaUkqYgkkNLuxS5k9PTCvtbCX+dfVQ1FJ4KZ3h34oPzNM5c8+yZyopHH7R
         Te+GGChVpfCwMr+6AJbetTfLdRd7L8b7DO+wXtaydMy9gS+fo+p/BXwnspHj3Z854RBR
         gwA+CD9M743lvj1f/z+ffo3Juv5MuymZfzisxTc+QNOK+PUCNqa2HlLlU0+0BaWBQHAq
         vZtQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+f42+trP4NTxYBdHp8o4zKuBrHoc6TsSP2avv50YQg5MgsZ2/rZKHmBeROgKos1yry9Cyk5T5yYmxKfU=@vger.kernel.org
X-Gm-Message-State: AFuF++lSUA0/5vsmcUs+XmakvRdn2BfUQpyNs3xsl5Z7FYydNVm4zz0s
	Dskdec4xTOpScufCUi4Dgbg45FbwOvFuGRsbM8aw4Szwhir3arRwTrSg9q4xJA==
X-Gm-Gg: AYBFou0LHCB4ZMaZYbI4loNWygjafB816xmElVnn1AD0D/XNIcGBfqUY416GCW+G200
	kPHUxdoPkuGAEwG5Pm/UpajZ9ufYtbpcjrIa8WD4BUeCFARpjO9KFI/U7U4jfIUyvw8Utdfri+C
	nHLBt/skgJXE0u/66BNeO3iAZ5KARXYVeEPEF2paAw9vTGh1asC/RgU81o8TgahD1QGcVTeT5sc
	5ToscFq2IxfKPFcyZPbRLTPmRUmFXSb1xDaRgeLiESVa4LV7EJrp8Ma9p8CwXYCJ8NPwuWBUzQw
	Ffg48eZlk2XZNjr9piHUfDifb/St73sfHJM0M90ZCKQSS3gOru5N13OieAFtQKbKbM4olhEfe0C
	KKpFEfB5ehved1eHiI4mg2MvC186APAptcMKyeaHGmLZxdW2up3070Xc1p1/hJzYBFeZz1Kwl+B
	ebMlcl44IhANybSXXPohCcBrcUyVEyw2n2vN+dYU+5yheQ5ShYJP41p6WMi8hFx8JREbX1u7M/C
	6I2UoI1TvHLLaPOIxJbf2iE5gJ1qCIF+B/zNUaABL6HaFWPLKp61JcNsw==
X-Received: by 2002:a17:90b:3c07:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-398c0ad98afmr24074334a91.15.1788231701893;
        Mon, 31 Aug 2026 20:01:41 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm30150628c88.15.2026.08.31.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:01:41 -0700 (PDT)
Message-ID: <6a964015.7d702ed2.1273e8.5ac0@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: 1 Sep 2026 08:31:41 +0530
Subject: [PATCH] staging: axis-fifo: fix underflow of tx_fifo_depth in size
 check
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

axis_fifo_write() bounds a transmit by checking:=0D=0A=0D=0A    w=
ords_to_write > (fifo->tx_fifo_depth - 4)=0D=0A=0D=0Afifo->tx_fif=
o_depth is an unsigned int populated directly from the=0D=0Adevic=
etree property "xlnx,tx-fifo-depth" in axis_fifo_parse_dt(),=0D=0A=
with no lower-bound validation. If a devicetree ever supplies a=0D=0A=
tx-fifo-depth smaller than 4 (e.g. a malformed or misconfigured D=
T),=0D=0A"tx_fifo_depth - 4" underflows, wrapping to a huge value=
. The size=0D=0Acheck above then never triggers, silently defeati=
ng the exact=0D=0Aoverrun protection the surrounding comment desc=
ribes: writes far=0D=0Alarger than the FIFO's real capacity get a=
ccepted and passed to the=0D=0Ahardware, driving it into the "Tra=
nsmit Packet Overrun Error"=0D=0Acondition the check exists to pr=
event.=0D=0A=0D=0AValidate tx_fifo_depth against the minimum the =
driver requires at=0D=0Adevicetree-parse time, matching the exist=
ing validation style already=0D=0Aused in axis_fifo_parse_dt() fo=
r the other DT properties.=0D=0A=0D=0ASigned-off-by: Manush Prajw=
al <manushprajwal555@gmail.com>=0D=0A---=0D=0A drivers/staging/ax=
is-fifo/axis-fifo.c | 7 +++++++=0D=0A 1 file changed, 7 insertion=
s(+)=0D=0A=0D=0Adiff --git a/drivers/staging/axis-fifo/axis-fifo.=
c b/drivers/staging/axis-fifo/axis-fifo.c=0D=0Aindex 3d358f919352=
3c..dba76fbf5d685a 100644=0D=0A--- a/drivers/staging/axis-fifo/ax=
is-fifo.c=0D=0A+++ b/drivers/staging/axis-fifo/axis-fifo.c=0D=0A@=
@ -412,6 +412,13 @@ static int axis_fifo_parse_dt(struct axis_fif=
o *fifo)=0D=0A 				   &fifo->tx_fifo_depth);=0D=0A 	if (ret)=0D=0A=
 		return ret;=0D=0A+	/*=0D=0A+	 * axis_fifo_write() computes 'tx=
_fifo_depth - 4' to bound the size of=0D=0A+	 * a transmit; a dep=
th smaller than that underflows the unsigned=0D=0A+	 * subtractio=
n and silently disables the overrun check.=0D=0A+	 */=0D=0A+	if (=
fifo->tx_fifo_depth < 4)=0D=0A+		return -EINVAL;=0D=0A =0D=0A 	re=
t =3D of_property_read_u32(node, "xlnx,use-rx-data",=0D=0A 				  =
 &fifo->has_rx_fifo);=0D=0A--=0D=0A2.43.0

