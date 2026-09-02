Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037514968FD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353507; cv=none; b=HL356aF2sm11ZmlI3RvHEvo7Nwl3mc4Zd1eEtrA2oDhysggZKo3+9bs8pJmVdwBiGqfAIc0aNzy4sAiWDhZqu5lmqKcltjQCcUrkFpojvG5ZOVVnX+3KR2q1PkDZUeGMaDG/DCG/hvw1To3f2AlFkzO0oYpvZU1ok7sRL8k9PQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353507; c=relaxed/simple;
	bh=+y+47c37F4DPDLDMUi9M4DCcyjsBthCXYAq7Hd4lqhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pVtACCmnwP308MGg7IoNSYY0MMLeWoyD3WG2iXBZyyjEARNayfSiS+RJDxJjPaUA7XFW3u+5t2hgukgRxFHcXHIAPJUmG3rqN0HIdVHSLSeNwaz09DlN1hS1BbR9/6pn/wAindeAS9V+le6w0WiNkz10xISmoAB97+42cJoNBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss7Clx+Z; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss7Clx+Z"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9392aa26b25so113873985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353503; x=1788958303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6QIrF2Yp0RPJAeeACAyBLGkspKOCeNb15ukntUyn84=;
        b=ss7Clx+ZjMNW0968lkcsW9RJPE3BvYRyNB1KaMW6j5yjCpixcP45uIijPCZe+6xyjw
         +Yz2JhIB+NnI4tFgf5uTSCUEHERXeaxtX6KhmAl1iAYE7sp2CWvliNp0ivTTnaB0E5kq
         seaUhp0Gxi9HXSap3+oRTPtKDqXvu2a+aL7onBPbovYAroiuWB58+xmq79lkdMn+zU56
         VkE4N7skHeGDohmT/jWVDH7++ejWST1+b7aq9S2M8Mp8F/LjgMyB3zmW+JyB5juUFKxO
         A8+g99D1RuOyCWl5vGRsT5ThkGP5p2Dn5x8EIYGXhpSleiEVxTWcSPSPpshMkChnVpqO
         npfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353503; x=1788958303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6QIrF2Yp0RPJAeeACAyBLGkspKOCeNb15ukntUyn84=;
        b=qnIMBKQpsxbsxHlWqfGnJCC4BwJUxU70wx4CjD9U5+BTty1EzTdH5nHyfCtL+grBlu
         DPmMgk0sULgh9rzRQFs8BQN7xisc2uZgG224uNoVDMshL6rYszZSPs6QRXej1DWj7wYY
         ej/qTuh6CaoIRvTZ3OvfRhBqX0QbsyIcMS9yBOx72mB03kBHyPeo3/R6/L8/MWHwLoIv
         Xdr8bzw6MLgez1iTL3W+QnuPMyRWwaxNlaF0E8VnWB6TFVq6olqU+xzB5cQXXYXWF1SQ
         LodAgCmgBAn8vVe49VUeU7coDYjb/9OcTGz3UPjH8Z4mri9A5gWI0iOIvzy5ZwZ1qEU1
         pp9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrBOvDTIIMpdkYwkvne2n4d3/M7gmoHcF7UcjJIKnRGZCwpMwsRbATMXa9m07EBcFRFtMpD8ObIQGziZQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++k/Myc8Et/c9X7QNHI4tbSV6AzzQ7hLh0lcNIy9iHf9D9J0J640
	s1LRuf+xkXovrinDChD11lU12R90kxEZpn3k1qiBou8byTk0gdiyx5z4VhFsMLl8
X-Gm-Gg: AR+sD11Ms4/fCl9eOjRzh6m7usUHUHb0Hhg0FfxG0S2BHDB3Nz/9tBQKq7LgM9xJVlJ
	QN53vZTiBCjCTiz5Ygwx7BR9dtBdfdcmkjrKth8ddugAyRzAQNLq0waJ9FDJa5D56DFMr47P4fh
	mmHJKSo10ig54cx6Eh+5bHf0j78D6lmA2QfCY+fnxKN4b8AXy1MGz5autwe48Rj+D4xWea3sTdm
	2fOutG/MofQ311mYI0nN9cIRrnmOUIP4LO/LnOHDTolMYFUmRMMZ+vqJDuvty/t4toBN9lItcaC
	5yai5fOO0/yWbnS1WmDsxBWilinzHVAWc2n7Sqw2aC5VXyqvc7+HaNKyMrxwBJVRmh64ffSUhKa
	ykLHwbIMVrUXwWNvO9Na6W/XKeondF58yauD+J//yKN0v6zK6n+PtSKmPFauKNYnm0DfUzcgEEX
	sk3wd/Rlb+e+p8Xp+YUZ1n8QrmFRvVD9cEo8Wb6vRNiGiktcakXVMY
X-Received: by 2002:a05:620a:4151:b0:936:ce17:dac3 with SMTP id af79cd13be357-93961019498mr501183085a.40.1788353503162;
        Wed, 02 Sep 2026 05:51:43 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f35d823sm198612785a.25.2026.09.02.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:51:42 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2 0/2] selftests: openvswitch: SCTP flow key coverage (IPv6 + NAT)
Date: Wed,  2 Sep 2026 08:51:31 -0400
Message-ID: <20260902125133.1828572-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCTP flow key test merged in August covers only IPv4 and only the
plain forwarding path. This series extends coverage to the two paths a
regression would otherwise ship silently on: SCTP over IPv6, and SCTP
across conntrack NAT (where OVS re-extracts L3/L4 on the recirculated
skb).

Both tests verify the association and then push a known payload across
and confirm the listener received it, so a flow-key bug that matches
handshake packets but breaks DATA chunks is caught rather than passing
on the handshake alone.

Full OVS selftest suite runs 19/19 green on a freshly built kernel.

v2:
  - no code changes; rebased onto current net-next after the tree
    reopened (v1 was deferred while net-next was closed)

Minxi Hou (2):
  selftests/net/openvswitch: add SCTP flow key test over IPv6
  selftests/net/openvswitch: add SCTP flow key test across conntrack NAT

 .../selftests/net/openvswitch/openvswitch.sh  | 183 +++++++++++++++++-
 1 file changed, 182 insertions(+), 1 deletion(-)


base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
-- 
2.55.0

