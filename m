Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F74E535B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980458; cv=none; b=In0PWa7Pkf1eUfPqHCgmrz1tbq9VpAJ6PTNh0CgrvEu35hXUfLl5zkzBsrR835qDaWNMllMKtKXkRVb05FxyTKY82Mh/tIRLJ3U65SnVVfngAgzERd+0P60R8VJbyLaSeUEaIzhJB4ri2zrKwdq27RqKn+euaFWfOFRfl/dJ890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980458; c=relaxed/simple;
	bh=f+BUHnK/frwIHFyquu1ForUX5GeELZYEY++DjzTBIvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0rsQk+65C2oXZGPacrNx3eI5vjnHy77zszFt5Wk1SBP7/ZD22gfVQLV1OmeJaFoBtoTFlRekaNpeU0V3cbpF0PZ1GJ910t5QLS/FSBlcOvIcJx57Wk8jmqjpMzycui0xgGb5Ps8NK+YGtv97cBMTdM5l2k6WSwxx9Wl65Xdy5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6I8Z//8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6I8Z//8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791980456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TQQ7+6eqouwNYuZ8PPxKwjYfkQfJbfvOS8GflEQeFdw=;
	b=K6I8Z//8H0vZenwDBy8SKIeuK5VS1noaO6ZjNtjIlCjw4sDY95NSwIX6TFc6H0RAjWs3eP
	1TGI+EWcIi02PhNgIXSMjqbfkzpCbz7vi3TcFqf87WtxnPAvyH7AZfHRJcLAQJWm0hLj39
	oQFUVqnE1Lny38CiFvN88CafdvsxGCM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-ChKVqJ01Pee7H1bxfjnpJw-1; Wed,
 14 Oct 2026 12:20:50 +0000
X-MC-Unique: ChKVqJ01Pee7H1bxfjnpJw-1
X-Mimecast-MFC-AGG-ID: ChKVqJ01Pee7H1bxfjnpJw_1791980449
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09DFD195606A;
	Wed, 14 Oct 2026 12:20:49 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2FA731800446;
	Wed, 14 Oct 2026 12:20:46 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] selftests: tc-testing: preload all qdisc modules enabled in config
Date: Wed, 14 Oct 2026 14:20:45 +0200
Message-ID: <20261014122045.2375722-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

tdc.sh preloads only some of the qdisc modules that the tc-testing
config enables. Add the missing ones: ingress, mqprio, multiq, netem,
pie, plug, prio, qfq, red, sfb, sfq, skbprio, taprio and tbf.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 tools/testing/selftests/tc-testing/tdc.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tdc.sh b/tools/testing/selftests/tc-testing/tdc.sh
index dae19687912d..25cdc256287d 100755
--- a/tools/testing/selftests/tc-testing/tdc.sh
+++ b/tools/testing/selftests/tc-testing/tdc.sh
@@ -65,6 +65,20 @@ try_modprobe sch_gred
 try_modprobe sch_hfsc
 try_modprobe sch_hhf
 try_modprobe sch_htb
+try_modprobe sch_ingress
+try_modprobe sch_mqprio
+try_modprobe sch_multiq
+try_modprobe sch_netem
+try_modprobe sch_pie
+try_modprobe sch_plug
+try_modprobe sch_prio
+try_modprobe sch_qfq
+try_modprobe sch_red
+try_modprobe sch_sfb
+try_modprobe sch_sfq
+try_modprobe sch_skbprio
+try_modprobe sch_taprio
+try_modprobe sch_tbf
 try_modprobe sch_teql
 try_modprobe sch_dualpi2
 ./tdc.py -J"$(nproc)"
-- 
2.56.0

