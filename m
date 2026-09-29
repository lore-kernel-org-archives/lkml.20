Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FC51E42F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699305; cv=none; b=uiVo3EaiG3vCF7AB6mteFf1zvMR/lrKes5UnJf+G2VSz+IDKHQreGQ77EclQ9VgV7/Y9VXT7SY3muerhPduxi+YLqi30QoCzrTVClUyLDUNTYgb7un82V+cVhikt1AiRrx4rgxCTYwhsBTpryhi/7L9YgV/iQYna+YoUM5YGbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699305; c=relaxed/simple;
	bh=xjNPYYVD4NJkISRiv4nk+t+tiwR6bKadykG+okrWRDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUdMnan5o/K1750CTufEm+yOoKENZBpqPunTsqMh7DDLkp6UMywcw7P8G37F1tPf5FiCiV6wHaeK7jbzn91wl+c3dvBstAJ6v0ixfDWkby0IDZfvRsl9JYrM0v7PsL41bweN6BzOdhy4RgcuQeh+IEmknC2Bq+NlKgzKFdnpYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=U90Cx0JU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="U90Cx0JU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so32998995e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790699301; x=1791304101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=U90Cx0JUaVC8LA/Vv7NNckkR4bLQq/WumHiTz+cxhKVxP8zgg/K05gPwIBgO3Reav6
         RnjOstL7Ztid2+LvjMciM9STqjtyGcwXv/vFmGvfgfg6mc0QPTl9twIKNDCEz5jdnwcA
         hjO7BpeCuqZrbdbaNQDHfemh+Qtg7XyhsLJyFMLSmuKC6KMxda0aFhJLV3c67zWgeRZF
         6KcLu+6KuCZaQePFwkdzeLmlu6zJVdFCif0BgkDkglKIEM1nJABm/8mC148l6k6q/gPo
         z2X17P6X48vxEZVTly3Ezl7VfEMERDDPlMcW4aNfxbKz7UR/lVGu8rqKSSjJ3EAuSIoR
         My3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699301; x=1791304101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=cczhPFcuvv/C4iImoA3Jpp/BNdTmB2WZnYOiPQjm2GxtlOwBwjdoo3QvHmru3o8xXy
         lFcRv8dAi4p632ZTDsh3gzOadzfrlrG9uQvEqPJm0cgkeW3iMHwu8f7cG227lSwXxCqJ
         tUmQ2SYZbvmxIeICPfvTq291llGGFFc4I9NItuU5nLQWY9YnEZr9Yns1HLC96hn4etTa
         mqc+EDdyPVyP6i2XqwPx0GHEn3Kd2ELGLuSiVQV+QfiCyvXaHJYhzfVmqIe96p0vNTfM
         MsWk7O2XEUirtJI2/UbEQs1cvS7q5vE2wyQnmAnaNcozoRxBaEKH+E4GGq4ybyUqk3YY
         JIfg==
X-Forwarded-Encrypted: i=1; AKwUvBz2E3H2dwEiF+0ywCaDB7bhRu8jFrQGOQ4NasjZ50ve5baCFv+YLC0Sqe9IqCLoKq4HFB87FZ2j0IEoWWc=@vger.kernel.org
X-Gm-Message-State: AFuF++mX5KDkKblMR8qwZlzPjqNUSe6YD5hSvPBVWAAjmP/oV3WKCed4
	yHO7mgG6bnC+Pcdt/+GTgdJJs4xTitgh8OdYALihRIGnc2LHKCnvxAdxL2Ey/ICyayE=
X-Gm-Gg: AYBFou2j/vICTYmmbB+ItSO5kGjDKR77PuOz36+1L9mhLZMa5XcOPSKCAMCPXPozHJR
	+zeu1/WHzR+ugSpQiAmOjYjnjx5tAu4/sx8NddBJc7slWJc/XLuYBvPPpbYAANMWFd//1AnSazP
	WbeOFUHXKDpd19GwwGaL3qEN/mhPex44vVESiLeSX3Cnp/mQWGBclgTHirMmY4ZbbAptjQj+4B/
	y52FT4CrFJ1SCEupOLGIIs+f8epER/Nno+bqIkzZMl7kSUcw4b+hsIF8WK/d3AyTWaUdmZKG5ve
	D49kvnHUkRVxS9WNhbB5e7PG9fnrwqItvr6euQfdTcKT0kZ4QNw4yI6l1JSh6UKhCZ6C6l8/BEG
	koNdKaaT0eAMmilJBNMiqznv/brgkSwHqqR6wdS+QITT/2BC+fzxL65bhX/zZ61mulvFn1tJwjW
	itOE6D1e8ldPQmstennkhrGpdha2nj1K8TrjI6YMRuIcOquYmwe0L61bTSpuciZ3UHmTDx9R7JI
	hJ8t7Sjaqu0
X-Received: by 2002:a05:600c:a06:b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-49ffd4ccdd5mr169628305e9.28.1790699301644;
        Tue, 29 Sep 2026 09:28:21 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9a7fsm425590eec.10.2026.09.29.09.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:28:19 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 29 Sep 2026 09:28:16 -0700
Subject: [PATCH 1/2] dt-bindings: eeprom: microchip,93lc46b: add Microchip
 93LC86C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-eeprom-93xx46-93lc86c-v1-1-272791aac875@nexthop.ai>
References: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
In-Reply-To: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699298; l=768;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=xjNPYYVD4NJkISRiv4nk+t+tiwR6bKadykG+okrWRDY=;
 b=QrWJS5LPCOlQ3GzSZb7Rj+lmyCJbhrFVXurWXAap2Vx26sCmrgo8ZPKPsgCESKGvXP9ktx6Y7
 A+swqJK2OOIBlH02Kep0UDLijBzb86esNO4RaCOm93DTYfQ84YpWh2n
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
index 144e86ce5c0a..8e782b70386a 100644
--- a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
+++ b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
@@ -18,6 +18,7 @@ properties:
       - atmel,at93c66
       - eeprom-93xx46
       - microchip,93lc46b
+      - microchip,93lc86c
 
   data-size:
     description: number of data bits per word

-- 
2.54.0

