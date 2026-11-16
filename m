Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842934;
	b=33a3WaG3k/TIBP15L/IjEyQBfDJJ31LYa4ze8aTa0H+8eYuHkVwFlcReEmvn7RW5/EpV
	 1F3LhKqMIJQlDsmYnZCmBNUPO1pCXNXVlqAZT9fTKuA/4HDnoE3hBRJ51EGrKcJqoN/jl
	 UD8f15t6KzB5x1CSST2kNdP2jIUiuj+RPO0/PpKc5UbVkqkDv7L+6hImxzu0a06nH+Knb
	 VtiyGWCsLg5p6/ylg89buI7mWEBJv5ebrcMN7+wumnbkfoJTnmE9Ifu4bx/oYbjG0BmsB
	 kVym5BJmok96EOKlc3lo6LB6Ka7xC7r19hmoXWSVnG1s3LCcY+KTMlK7m+Wt5vlCwPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842934;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=mHw+xTQLwXPEuBlCq7WEDAzvFFnVHdZ25AnZYeUrXBQ=;
	b=gp0vLZFcSkTgT7JE2/O8ZI+bcqq+lLoqKbJVHZkjhS30x14U/Pbw6NIr/keaiDMOew02
	 TGp7t7OOKwsufpTps/kNNXAEm2SM8Z50wLmwkyD6TlOofrmNND7giNdESP+vhM0X+sZWX
	 ZnHwIJF24nk6zBUXd8e8/jSjQg5ptgf81Y461GHh84cAE1KH5xnOhMMxeqU7WmSjIXsdx
	 BV+7fd3SLlz7fQBnZbbPvZTFCKthz4xsIdIzO5SRsAZnUIa2CMN2pKzrtGM0SO3SOv9lV
	 hvWKpwY1KmNLA/26wE0VisVs+dBCxsjOE804i/2leE+petZ8wtHqzkEYseCqY4SZnPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=nRH98kVQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B32606A88E;
	Mon, 16 Nov 2026 15:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B32606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=nRH98kVQ
ARC-Seal: i=1; a=rsa-sha256; t=1794842894; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G991lwr55tv2imdIQhMkroROru8CgIk0urTfmXBdWb90Tm7kS83Wk56/m/4V4PiPFQyAAyxlmzJiG8D2T4hs9q6R4kcSlTMMoQjhhoyQFkUsOatm07Ek6XBIWBMbpjmh6uApU1OFlPVfa9WpwZ36/VIBQmp9v89ZkD6KQ8yVsOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842894; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mHw+xTQLwXPEuBlCq7WEDAzvFFnVHdZ25AnZYeUrXBQ=; 
	b=QCDP1bQYIOWyJ9MiIU+MWhPZNqJc2FCjpDYf8HWz9HLZtdF9yRAliGFfynHxiJ2/hrczZENolS+3i191wkDivoY7goWO6cV20AaQUv/va3uW2ONnRTezhR+wlMrx+laA+fJxLy2CGYJgnjhXeU87YO1RigIHeHtqzVQVE3emONI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=nRH98kVQKeXO94VmMJSCv0okS+2feErSc2Du6rorfUb8L4PNMRoUV1r4df6XR0FkGzcNOfx+W6LvkauL8fz0hchr5TowzeKMCnDpfEPFHqUi8TAy400mdg2FtZ/tyQoDGE664nIBGDQzgBPJ/smeMd5iS0ombHWJ9Elyi9Wkq+u1P9+iyDmTIOC3nR8tpC0tjl48f992eCoefjI3BxOdhVZSGC8Rpl3Sik+YjF1i0RUweLCmRYcAJQdmSrHHagQeqTo6hazAXj8FyzeI13gV2HJt3iqZdmffait0LJR8TkdBUf9Zm6S+2Tl5VchjeWz3SPDETIuu/qT+ag30RMZ3jA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=mHw+xTQLwXPEuBlCq7WEDAzvFFnVHdZ25AnZYeUrXBQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842891192855.5017060295374;
	Mon, 16 Nov 2026 07:28:11 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 00/10] wifi: rtw89: monitor mode RX filter and raw frame injection fixes
Date: Mon, 16 Nov 2026 20:27:52 +0500
Message-ID: <20261116152804.781-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <d98c4958d51e46bdbe5f5d3d2415585b@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <d98c4958d51e46bdbe5f5d3d2415585b@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Nov 15, 2026 at 03:12:12AM +0000, Ping-Ke Shih wrote:
> At first glance, I saw v5. I was confused, because I don't remember I have
> seen v4. Please not count your local version.

Sorry for the confusion. I bumped the version locally before sending
and should not have counted an unsent revision. I will drop the local v4
entry in v6 and only count public postings from now on.

Thanks,
Enver
